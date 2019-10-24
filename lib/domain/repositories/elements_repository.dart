import 'package:color_game/model/field_type.dart';

abstract class ElementsRepository {

  int getStrengthByType(BoardFieldType fieldType);

  BoardFieldType getAtPosition(int position);
}
