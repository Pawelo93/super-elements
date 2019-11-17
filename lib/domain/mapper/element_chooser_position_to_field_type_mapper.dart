import 'package:color_game/model/field_type.dart';

class ElementChooserPositionToFieldTypeMapper {

  BoardFieldType map(int position) {
    if (position == 1) {
      return BoardFieldType.FIRE;
    } else if (position == 2) {
      return BoardFieldType.WATER;
    } else if (position == 3) {
      return BoardFieldType.AIR;
    } else {
      return BoardFieldType.EMPTY;
    }
  }
}