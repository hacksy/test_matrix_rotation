import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'matrix_state.dart';

class MatrixCubit extends Cubit<MatrixState> {
  MatrixCubit() : super(MatrixState.empty());
  List<String> matrix = [];
  void updateInput(String input) {}

  void rotate() {}
  void counterRotate() {}
}
