import 'package:color_game/bloc/round_counter/round_counter_event.dart';
import 'package:color_game/bloc/round_counter/round_counter_state.dart';
import 'package:bloc/bloc.dart';

class RoundCounterBloc extends Bloc<RoundCounterEvent, RoundCounterState> {

  @override
  RoundCounterState get initialState => Uninitialized();

  @override
  Stream<RoundCounterState> mapEventToState(RoundCounterEvent event) async* {
    print('Event $event');
    if(event is Setup) {
      yield Round(event.maxRounds, 1);
    }
  }
}
