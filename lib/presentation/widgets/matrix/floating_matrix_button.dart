import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/domain/bloc/matrix_cubit.dart';

class FloatingMatrixButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixCubit, MatrixState>(
        builder: (BuildContext context, MatrixState state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: state.status == MatrixStatus.valid
                ? () {
                    BlocProvider.of<MatrixCubit>(context).counterRotate();
                  }
                : null,
            child: Icon(Icons.rotate_left),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
              onPressed: state.status == MatrixStatus.valid
                  ? () {
                      BlocProvider.of<MatrixCubit>(context).rotate();
                    }
                  : null,
              child: Icon(Icons.rotate_right)),
        ],
      );
    });
  }
}
