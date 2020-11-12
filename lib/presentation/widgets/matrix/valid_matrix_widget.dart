part of 'matrix_widget.dart';

class _ValidMatrixWidget extends StatelessWidget {
  final List<String> items;
  _ValidMatrixWidget({this.items});
  @override
  Widget build(BuildContext context) {
    var squaredSize = sqrt(items.length).floor();
    return GridView.builder(
      itemCount: squaredSize,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int pos) {
        return Container(
          child: Text(items[pos]),
        );
      },
    );
  }
}
