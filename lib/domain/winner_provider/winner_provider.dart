import '../../bloc/game/game_state.dart';
import '../../model/game_board.dart';

abstract class WinnerProvider {
  Winner provide(GameBoard gameBoard);
}