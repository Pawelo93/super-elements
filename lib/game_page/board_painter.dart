import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/owner_type.dart';
import 'package:flutter/material.dart';

import 'board.dart';
import 'dart:ui' as ui;

class BoardPainter extends CustomPainter {
  static int pointsOffset = 30;

  final Board board;
  final Map<String, ui.Image> images;

  Paint backgroundPaint = Paint()
    ..color = Colors.grey
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke;

  Paint elementPaint = Paint()..style = PaintingStyle.fill;

  BoardPainter(this.board, this.images);

  @override
  void paint(Canvas canvas, Size size) {
    var length = size.width - pointsOffset;
    var cellSize = length / Board.width;

    for (int i = 0; i < Board.width; i++) {
      for (int j = 0; j < Board.width; j++) {
       canvas.drawRect(
          Rect.fromPoints(
            Offset(i * cellSize + cellSize, j * cellSize),
            Offset(i * cellSize, j * cellSize + cellSize),
          ),
          backgroundPaint,
        );

        String whoWon;

        if (board.whoWonRow(j) == OwnerType.PLAYER)
          whoWon = "player";
        else if (board.whoWonRow(j) == OwnerType.COMPUTER)
          whoWon = "comp";
        else
          whoWon = "0";

//        print('draw ${board.getPointsForColumn(j).toString()}');
        _drawText(
          canvas,
          whoWon,
          size.width - pointsOffset / 2,
          j * cellSize + cellSize / 2 - 10,
          Colors.grey,
        );
      }

      String whoWon;

      if (board.whoWonColumn(i) == OwnerType.PLAYER)
        whoWon = "player";
      else if (board.whoWonColumn(i) == OwnerType.COMPUTER)
        whoWon = "comp";
      else
        whoWon = "0";

      _drawText(
        canvas,
        whoWon,
        i * cellSize + cellSize / 2 - 10,
        size.width - pointsOffset / 2,
        Colors.grey,
      );
    }

    board.list.forEach(
      (cellItem) {
        if (cellItem.fieldType == FieldType.FIRE)
          elementPaint.color = Colors.red;

        if (cellItem.fieldType == FieldType.WATER)
          elementPaint.color = Colors.blue;

        if (cellItem.fieldType == FieldType.AIR)
          elementPaint.color = Colors.cyanAccent;

        if (cellItem.fieldType == FieldType.GROUND)
          elementPaint.color = Colors.grey;

        var offset = 10;
        var x = cellItem.x.toDouble() * cellSize + offset / 2;
        var y = cellItem.y.toDouble() * cellSize + offset / 2;
        var size = (cellSize - offset) / 2;

        canvas.drawRect(
          Rect.fromPoints(
            Offset(x, y),
            Offset(x + size * 2, y + size * 2),
          ),
          elementPaint,
        );

        var text = "";
        if (cellItem.ownerType == OwnerType.PLAYER)
          text = "player";
        else
          text = "computer";

        _drawText(
          canvas,
          text,
          x + size / 2 - 10,
          y + size + 15,
          Colors.white,
        );
      },
    );
  }

  void _drawText(Canvas canvas, String text, double x, double y, Color color) {
    TextPainter tp = TextPainter(
      text: TextSpan(style: TextStyle(color: color), text: text),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(
        x,
        y,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
