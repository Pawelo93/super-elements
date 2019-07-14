import 'package:color_game/model/states/field_type.dart';

class ElementController {

  FieldType actualElement = FieldType.FIRE;

  setFire() {
    actualElement = FieldType.FIRE;
  }

  setWater() {
    actualElement = FieldType.WATER;
  }

  setAir() {
    actualElement = FieldType.AIR;
  }

  setGround() {
    actualElement = FieldType.GROUND;
  }
}