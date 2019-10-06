import 'dart:math';

import 'package:color_game/model/states/field_type.dart';
import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  final FieldType fieldType;
  final Point point;

  GameEvent(this.fieldType, this.point);
}

class PlayerMove extends GameEvent {
  PlayerMove(FieldType fieldType, Point point) : super(fieldType, point);

  @override
  String toString() {
    return 'PlayerMove{fieldType: $fieldType, point: $point}';
  }
}

class ComputerMove extends GameEvent {
  ComputerMove(FieldType fieldType, Point point) : super(fieldType, point);

  @override
  String toString() {
    return 'ComputerMove{fieldType: $fieldType, point: $point}';
  }
}