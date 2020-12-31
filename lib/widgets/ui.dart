import 'package:flutter/material.dart';

class TodoText extends StatelessWidget {
  int val;
  TodoText(this.val);
  /*const TodoText({
    Key key,
  }) : super(key: key);
*/
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Text(
        val == 0 ? '' : "$val task",
        style: TextStyle(
          color: Colors.pink[300],
          fontSize: 50,
        ),
      ),
      top: MediaQuery.of(context).size.height / 7,
      left: MediaQuery.of(context).size.width / 30,
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height ,
      width: MediaQuery.of(context).size.width,
      child: Image.asset('assets/a.png'),
    );
  }
}

BoxDecoration myBox(double a, double b, double c, double d, Color couleur) {
  return BoxDecoration(
    color: couleur,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(a),
      topLeft: Radius.circular(b),
      bottomLeft: Radius.circular(c),
      bottomRight: Radius.circular(d),
    ),
  );
}
