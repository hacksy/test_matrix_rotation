part of 'matrix_widget.dart';

class _ValidMatrixWidget extends StatelessWidget {
  final List<String> items;
  _ValidMatrixWidget({this.items});
  @override
  Widget build(BuildContext context) {
    var squaredSize = sqrt(items.length).floor();
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: squaredSize),
        itemBuilder: (BuildContext context, int pos) {
          return Container(
            height: 35,
            width: 35,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Center(child: Text(items[pos])),
          );
        },
      ),
    );
  }
}
