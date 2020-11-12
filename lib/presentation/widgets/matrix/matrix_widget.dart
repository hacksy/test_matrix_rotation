import 'dart:math';

import 'package:flutter/material.dart';
part 'valid_matrix_widget.dart';
part 'invalid_matrix_widget.dart';

class MatrixWidget extends StatelessWidget {
  final List<String> items;
  MatrixWidget({this.items});
  @override
  Widget build(BuildContext context) {
    //Lets validate that I have n x n items, otherwise , show an error message
    if (sqrt(items.length).ceilToDouble() ==
        sqrt(items.length).floorToDouble()) {
      return _ValidMatrixWidget(items: items);
    } else {
      return _InvalidMatrixWidget();
    }
  }
}
