import 'package:flutter/material.dart';

class ElementButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final Color color;

  ElementButton({
    this.title,
    this.onPress,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
