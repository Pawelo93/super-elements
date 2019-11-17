import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundCounter extends StatelessWidget {
  final RoundCounterBloc roundCounterBloc;

  const RoundCounter({Key key, this.roundCounterBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoundCounterBloc, RoundCounterState>(
      builder: (context, RoundCounterState state) {
        if (state is Round) {
          return Text(
            'Round ${state.currentRound} / ${state.maxRounds}',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          );
        } else
          return Text('Not started yet!');
      },
    );
  }
}
