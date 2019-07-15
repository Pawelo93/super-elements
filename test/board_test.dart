import 'package:color_game/game_page/board.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/owner_type.dart';
import 'package:flutter_test/flutter_test.dart';

class BoardTest {

  main() {
    test('getPointsForRow should return x ', () {
//      final board = Board();
//      addToBoard(board, 0, 0);
//      addToBoard(board, 1, 0);
//      addToBoard(board, 2, 0);
//      addToBoard(board, 3, 0);

//      expect(board.getPointsForRow(0), matcher)
    });
  }

  void addToBoard(Board board, int x, int y) {
    board.set(x, y, FieldType.FIRE, OwnerType.PLAYER);
  }
}