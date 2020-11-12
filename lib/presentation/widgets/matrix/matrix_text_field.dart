import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/domain/bloc/matrix_cubit.dart';

class MatrixTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<MatrixCubit>(context).updateInput(value);
      },
    );
  }
}
