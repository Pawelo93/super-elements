import 'package:bloc/bloc.dart';
import 'package:color_game/bloc/game_event.dart';
import 'package:color_game/bloc/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {

  @override
  GameState get initialState => null;

  @override
  Stream<GameState> mapEventToState(GameEvent event) {
    return null;
  }
}