import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/domain/bloc/matrix_cubit.dart';

class OutputTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixCubit, MatrixState>(
      builder: (BuildContext context, MatrixState state) {
        if (state.status == MatrixStatus.valid) {
          return Center(child: Text("Output: ${state.matrix.toString()}"));
        } else {
          return Container();
        }
      },
    );
  }
}
