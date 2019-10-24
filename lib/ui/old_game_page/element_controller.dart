import 'package:color_game/model/field_type.dart';

class ElementController {

  BoardFieldType actualElement = BoardFieldType.FIRE;

  setFire() {
    actualElement = BoardFieldType.FIRE;
  }

  setWater() {
    actualElement = BoardFieldType.WATER;
  }

  setAir() {
    actualElement = BoardFieldType.AIR;
  }

  setGround() {
    actualElement = BoardFieldType.GROUND;
  }
}