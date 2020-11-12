import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'matrix_state.dart';

class MatrixCubit extends Cubit<MatrixState> {
  MatrixCubit() : super(MatrixState.empty());
  List<String> matrix = [];
  void updateInput(String input) {
    if (!_checkIfInputIsValid(input)) {
      emit(MatrixState.invalid());
      return;
    }
    var currentState = MatrixState.valid(matrix);
    emit(currentState);
  }

  void rotate() {
    matrix = _rotate90Clockwise(matrix);
    var currentState = MatrixState.valid(matrix);
    emit(currentState);
  }

  void counterRotate() {
    //We consider that matrix is valid, so we can rotate against the clock
    matrix = _rotate90CounterClockwise(matrix);
    var currentState = MatrixState.valid(matrix);
    emit(currentState);
  }

  //These functions will probably need to be on an util file
  //Currently here b/c is not used anywhere else
  bool _checkIfInputIsValid(String input) {
    //Reinit matrix
    matrix = [];
    //Remove unneded empty spaces
    input = input.trim();
    //Regex to match
    RegExp matrixRegExp = RegExp(r'\[(\[((\d+)[ ]?,?)+][ ]?,?[ ]?)+\]');
    if (!matrixRegExp.hasMatch(input)) {
      return false;
    }
    //Check if it contains the number of elements needed
    //Count how many small arrays we have
    List<String> itemList = [];
    for (RegExpMatch match in RegExp(r'(\[[0-9,]+\])').allMatches(input)) {
      //Add to my tempBucket
      itemList.add(match.group(1));
    }
    //Set parent size
    int bucketSize = itemList.length;
    for (String item in itemList) {
      //Get all numbers
      var matches = RegExp(r'([0-9]+)').allMatches(item);
      //If matches length != parent Size , is invalid
      if (matches.length != bucketSize) {
        return false;
      }
      //Append all numbers to my list
      for (RegExpMatch match in matches) {
        matrix.add(match.group(1));
      }
    }

    return true;
  }

  List<String> _rotate90Clockwise(List<String> flatMatrix) {
    List<List<String>> matrix = _matrixFromFlatMatrix(flatMatrix);

    var n = matrix.length;
    for (int i = 0; i < n / 2; i++) {
      for (int j = i; j < n - i - 1; j++) {
        String temp = matrix[i][j];
        matrix[i][j] = matrix[n - 1 - j][i];
        matrix[n - 1 - j][i] = matrix[n - 1 - i][n - 1 - j];
        matrix[n - 1 - i][n - 1 - j] = matrix[j][n - 1 - i];
        matrix[j][n - 1 - i] = temp;
      }
    }

    return _flatMatrixFromMatrix(matrix);
  }

  List<String> _rotate90CounterClockwise(List<String> flatMatrix) {
    List<List<String>> matrix = _matrixFromFlatMatrix(flatMatrix);
    var n = matrix.length;

    for (int i = 0; i < n / 2; i++) {
      for (int j = i; j < n - i - 1; j++) {
        String temp = matrix[i][j];
        matrix[i][j] = matrix[j][n - 1 - i];
        matrix[j][n - 1 - i] = matrix[n - 1 - i][n - 1 - j];

        matrix[n - 1 - i][n - 1 - j] = matrix[n - 1 - j][i];
        matrix[n - 1 - j][i] = temp;
      }
    }
    return _flatMatrixFromMatrix(matrix);
  }

  List<List<String>> _matrixFromFlatMatrix(List<String> flatMatrix) {
    int size = sqrt(flatMatrix.length).toInt();
    List<List<String>> matrix = List<List<String>>(size);
    for (int index = 0; index < flatMatrix.length; index++) {
      int x = (index) ~/ size;
      int y = (index) % size;
      if (matrix[x] == null) {
        matrix[x] = List<String>(size);
      }
      matrix[x][y] = flatMatrix[index];
    }
    return matrix;
  }

  List<String> _flatMatrixFromMatrix(List<List<String>> matrix) {
    List<String> flatMatrix = List<String>();
    for (List<String> items in matrix) {
      for (String item in items) {
        flatMatrix.add(item);
      }
    }
    return flatMatrix;
  }
}
