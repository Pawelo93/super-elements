import 'package:color_game/model/states/field_type.dart';

class ElementChooserPositionToFieldTypeMapper {

  FieldType map(int position) {
    if (position == 1) {
      return FieldType.FIRE;
    } else if (position == 2) {
      return FieldType.WATER;
    } else if (position == 3) {
      return FieldType.AIR;
    } else {
      return FieldType.EMPTY;
    }
  }
}