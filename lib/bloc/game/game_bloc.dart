import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/domain/repositories/board_repository.dart';

import '../board/board_bloc.dart';
import '../board/board_event.dart';
import '../round_counter/round_counter_event.dart';
import '../round_counter/round_counter_state.dart';
import 'package:bloc/bloc.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final BoardBloc boardBloc;
  final RoundCounterBloc roundCounterBloc;
  final ElementChooserBloc elementChooserBloc;
  final BoardRepository boardRepository;

  GameBloc(this.boardBloc, this.roundCounterBloc, this.elementChooserBloc,
      this.boardRepository);

  @override
  GameState get initialState => GameNotStarted();

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if(event is NewGame) {
      _setupGame();
      yield GameStarted();
    }
  }

  void _setupGame() {
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