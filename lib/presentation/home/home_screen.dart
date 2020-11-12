import 'package:flutter/material.dart';
import 'package:flutter_test_app/presentation/widgets/matrix/matrix_widget.dart';

class HomeScreen extends StatelessWidget {
  final items = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  final items2 = ["3", "6", "9", "2", "5", "8", "1", "4", "7"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Matrix"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(),
            SizedBox(height: 15),
            MatrixWidget(items: items),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.rotate_90_degrees_ccw),
      ),
    );
  }
}
