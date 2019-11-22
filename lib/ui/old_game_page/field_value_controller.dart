import 'dart:math';

import 'package:color_game/model/field_type.dart';

class FieldValueController {
  Map<BoardFieldType, int> values = Map();

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

    values[BoardFieldType.FIRE] = base;
    values[BoardFieldType.WATER] = waterValue;
    values[BoardFieldType.AIR] = airValue;
    values[BoardFieldType.GROUND] = 4;

//    print('Fire: ${base}, water: $waterValue, air: $airValue');
  }

  int getValue(BoardFieldType type) {
    switch (type) {
      case BoardFieldType.FIRE:
        return values[type];
      case BoardFieldType.WATER:
        return values[type];
      case BoardFieldType.AIR:
        return values[type];
      case BoardFieldType.GROUND:
        return values[type];
      case BoardFieldType.EMPTY:
        return 0;
    }
  }
}
