import 'package:color_game/model/field_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class GameEvent extends Equatable {

}

class StartGame extends GameEvent {
  final isPlayerStaring;

  StartGame({@required this.isPlayerStaring});

  @override
  String toString() {
    return 'StartGame{isPlayerStarting: $isPlayerStaring';
  }
}

abstract class Move extends GameEvent {
  final BoardFieldType fieldType;
  final int x;
  final int y;

  Move(this.fieldType, this.x, this.y);
}

class PlayerMove extends Move {
  PlayerMove(BoardFieldType fieldType, int x, int y) : super(fieldType, x, y);

  @override
  String toString() {
    return 'PlayerMove{fieldType: $fieldType, x: $x, y: $y}';
  }
}

class ComputerMove extends Move {
  ComputerMove(BoardFieldType fieldType, int x, int y) : super(fieldType, x, y);

  @override
  String toString() {
    return 'ComputerMove{fieldType: $fieldType, x: $x, y: $y}';
  }
}