import 'dart:math';

import 'package:color_game/model/states/field_type.dart';
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
  final FieldType fieldType;
  final Point point;

  Move(this.fieldType, this.point);
}

class PlayerMove extends Move {
  PlayerMove(FieldType fieldType, Point point) : super(fieldType, point);

  @override
  String toString() {
    return 'PlayerMove{fieldType: $fieldType, point: $point}';
  }
}

class ComputerMove extends Move {
  ComputerMove(FieldType fieldType, Point point) : super(fieldType, point);

  @override
  String toString() {
    return 'ComputerMove{fieldType: $fieldType, point: $point}';
  }
}