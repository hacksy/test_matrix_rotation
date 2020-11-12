import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/domain/bloc/matrix_cubit.dart';
import 'package:flutter_test_app/presentation/widgets/matrix/floating_matrix_button.dart';
import 'package:flutter_test_app/presentation/widgets/matrix/matrix_text_field.dart';
import 'package:flutter_test_app/presentation/widgets/matrix/matrix_widget.dart';
import 'package:flutter_test_app/presentation/widgets/output_text_field.dart';

class HomeScreen extends StatelessWidget {
  final MatrixCubit _matrixCubit = MatrixCubit();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<MatrixCubit>(
      create: (context) => _matrixCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Matrix"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MatrixTextField(),
              SizedBox(height: 15),
              OutputTextField(),
              SizedBox(height: 15),
              MatrixWidget(),
            ],
          ),
        ),
        floatingActionButton: FloatingMatrixButton(),
      ),
    );
  }
}
