import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/repositories/field_types_repository.dart';

class FieldTypesRepositoryImpl implements FieldTypesRepository {
  @override
  FieldType getAtPosition(int position) {
    if (position == 0)
      return FieldType.FIRE;
    else if (position == 1)
      return FieldType.WATER;
    else if (position == 2)
      return FieldType.AIR;
    else
      throw Exception("There's no FieldType for position $position");
  }
}
