import 'package:color_game/model/states/field_type.dart';

abstract class FieldTypesRepository {
  FieldType getAtPosition(int position);
}