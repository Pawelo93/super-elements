import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final Color color;
  final Color highlightColor;

  ActionButton({
    this.title,
    this.onPress,
    this.color,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2.0,
      color: color,
      highlightColor: highlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
