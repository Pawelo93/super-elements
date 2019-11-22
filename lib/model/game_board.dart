import 'cell_item.dart';

abstract class GameBoard {

  bool isFull();

  bool isValidMove(int x, int y);

  CellItem get(int i, int j);
}