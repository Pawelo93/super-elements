import 'package:color_game/model/field_type.dart';
import 'package:equatable/equatable.dart';

class SecondPlayerMove extends Equatable {
  final BoardFieldType boardFieldType;
  final int x;
  final int y;

  SecondPlayerMove(this.boardFieldType, this.x, this.y);

  @override
  String toString() {
    return 'SecondPlayerMove{boardFieldType: $boardFieldType, x: $x, y: $y}';
  }
}