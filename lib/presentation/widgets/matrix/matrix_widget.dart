import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/domain/bloc/matrix_cubit.dart';
part 'valid_matrix_widget.dart';
part 'invalid_matrix_widget.dart';

class MatrixWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixCubit, MatrixState>(
      builder: (BuildContext context, MatrixState state) {
        switch (state.status) {
          case MatrixStatus.processing:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case MatrixStatus.invalid:
            return _InvalidMatrixWidget();
            break;
          case MatrixStatus.valid:
            return _ValidMatrixWidget(items: state.matrix);
            break;
          case MatrixStatus.empty:
          default:
            return Container(
              child: Center(
                child: Text("Ingrese su matriz"),
              ),
            );
            break;
        }
      },
    );
  }
}
