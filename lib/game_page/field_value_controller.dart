import 'package:color_game/model/states/field_type.dart';

class FieldValueController {

  Map<FieldType, int> values = Map();

  FieldValueController() {
    values[FieldType.FIRE] = 1;
    values[FieldType.WATER] = 2;
    values[FieldType.AIR] = 3;
    values[FieldType.GROUND] = 4;

  }

  int getValue(FieldType type) {
    switch (type) {
      case FieldType.FIRE: return values[type];
      case FieldType.WATER: return values[type];
      case FieldType.AIR: return values[type];
      case FieldType.GROUND: return values[type];
      case FieldType.EMPTY: return 0;
    }
  }
}
