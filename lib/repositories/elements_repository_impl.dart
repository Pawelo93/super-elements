import 'package:color_game/domain/repositories/elements_repository.dart';
import 'package:color_game/model/field_type.dart';

class ElementsRepositoryImpl implements ElementsRepository{
  Map<BoardFieldType, int> values = Map();

  ElementsRepositoryImpl() {
    values[BoardFieldType.FIRE] = 1;
    values[BoardFieldType.WATER] = 2;
    values[BoardFieldType.AIR] = 3;
    values[BoardFieldType.GROUND] = 4;

    print('Fire: ${1}, water: ${2}, air: ${3}');
  }

  @override
  int getStrengthByType(BoardFieldType type) {
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
    }
    return 0;
  }

  @override
  BoardFieldType getAtPosition(int position) {
    if (position == 0)
      return BoardFieldType.FIRE;
    else if (position == 1)
      return BoardFieldType.WATER;
    else if (position == 2)
      return BoardFieldType.AIR;
    else
      throw Exception("There's no FieldType for position $position");
  }
}