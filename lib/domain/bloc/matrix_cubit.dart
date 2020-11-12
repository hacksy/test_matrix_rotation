import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'matrix_state.dart';

class MatrixCubit extends Cubit<MatrixState> {
  MatrixCubit() : super(MatrixState.empty());
  List<String> matrix = [];
  void updateInput(String input) {
    if (!checkIfInputIsValid(input)) {
      emit(MatrixState.invalid());
      return;
    }
    var currentState = MatrixState.valid(matrix);
    emit(currentState);
  }

  void rotate() {
    //We consider that matrix is valid
  }
  void counterRotate() {
    //We consider that matrix is valid
  }

  //These functions will probably need to be on an util file
  //Currently here b/c is not used anywhere else
  bool checkIfInputIsValid(String input) {
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
}
