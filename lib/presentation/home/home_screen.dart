import 'package:flutter/material.dart';
import 'package:flutter_test_app/presentation/widgets/matrix/matrix_widget.dart';

class HomeScreen extends StatelessWidget {
  final items = List<String>.generate(81, (int index) => "${index + 1}");
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
