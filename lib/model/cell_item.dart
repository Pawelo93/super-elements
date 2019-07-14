
import 'package:color_game/model/states/field_type.dart';

import 'states/owner_type.dart';

class CellItem {
  final int x;
  final int y;
  final FieldType fieldType;
  final OwnerType ownerType;

  CellItem(this.x, this.y, this.fieldType, this.ownerType);
}