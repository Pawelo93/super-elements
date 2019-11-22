import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/domain/repositories/board_repository.dart';

import 'bloc/board/board_bloc.dart';
import 'bloc/board/board_event.dart';
import 'bloc/round_counter/round_counter_event.dart';
import 'bloc/round_counter/round_counter_state.dart';

class GameManager {
  final BoardBloc boardBloc;
  final RoundCounterBloc roundCounterBloc;
  final ElementChooserBloc elementChooserBloc;
  final BoardRepository boardRepository;

  GameManager(this.boardBloc, this.roundCounterBloc, this.elementChooserBloc,
      this.boardRepository);

  void setupGame() {
    boardRepository.clear();
    boardBloc.add(StartGame(isPlayerStaring: true));
    roundCounterBloc.add(Setup(3));
  }

  void nextRound() {
    boardRepository.clear();
    RoundCounterState roundCounterState = roundCounterBloc.state;
    print('round couter $roundCounterState');
    if (roundCounterState is Round) {
      if(roundCounterState.currentRound == roundCounterState.maxRounds)
        _endGame();
      else
        _nextRound(roundCounterState.currentRound + 1);
    }
  }

  void _endGame() {
//    boardBloc.add()
  }

  void _nextRound(int newRound) {
    roundCounterBloc.add(NextRound(newRound));
    boardBloc.add(StartGame(isPlayerStaring: true));
  }
}
