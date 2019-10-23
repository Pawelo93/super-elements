import 'package:color_game/model/states/field_type.dart';
import 'package:equatable/equatable.dart';

abstract class ElementChooserState extends Equatable {

  ElementChooserState([List props = const []]) : super(props);
}

class Uninitialized extends ElementChooserState {

  Uninitialized();

  @override
  String toString() => 'Uninitialized';
}

class Selected extends ElementChooserState {
  final FieldType fieldType;

  Selected(this.fieldType) : super([fieldType]);

  @override
  String toString() => 'Selected {fieldType: $fieldType}';
}