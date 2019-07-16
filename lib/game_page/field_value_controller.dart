import 'dart:math';

import 'package:color_game/model/states/field_type.dart';

class FieldValueController {
  Map<FieldType, int> values = Map();

  FieldValueController() {
    Random random = Random();
    var base = random.nextInt(3) + 5;
    var addWater = random.nextBool();
    var addAir = random.nextBool();
    var additionWater = random.nextInt(2);
    var additionAir = random.nextInt(2);

    var waterValue;
    var airValue;

    if (addWater) {
      waterValue = base + additionWater;
    } else
      waterValue = base - additionWater;

    if(addAir)
      airValue = base + additionAir;
    else
      airValue = base - additionAir;

    values[FieldType.FIRE] = base;
    values[FieldType.WATER] = waterValue;
    values[FieldType.AIR] = airValue;
    values[FieldType.GROUND] = 4;

    print('Fire: ${base}, water: $waterValue, air: $airValue');
  }

  int getValue(FieldType type) {
    switch (type) {
      case FieldType.FIRE:
        return values[type];
      case FieldType.WATER:
        return values[type];
      case FieldType.AIR:
        return values[type];
      case FieldType.GROUND:
        return values[type];
      case FieldType.EMPTY:
        return 0;
    }
  }
}
