import 'package:color_game/model/field_type.dart';
import 'owner_type.dart';

class CellItem {
  final int x;
  final int y;
  final BoardFieldType fieldType;
  final OwnerType ownerType;

  CellItem(this.x, this.y, this.fieldType, this.ownerType);

  @override
  String toString() {
    return "CellItem {x: $x, y: $y, fieldType: $fieldType, ownerType $ownerType}";
  }
}