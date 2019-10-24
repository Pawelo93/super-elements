import 'package:color_game/model/field_type.dart';
import 'package:equatable/equatable.dart';

class Element extends Equatable {
  final BoardFieldType boardFieldType;
  final int strength;

  Element(this.boardFieldType, this.strength)
      : super([boardFieldType, strength]);
}
