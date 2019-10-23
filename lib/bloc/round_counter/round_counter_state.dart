import 'package:equatable/equatable.dart';

abstract class RoundCounterState extends Equatable {
  RoundCounterState([List props = const []]) : super(props);
}

class Uninitialized extends RoundCounterState {

  @override
  String toString() => 'Uninitialized';
}

class Round extends RoundCounterState {
  final int maxRounds;
  final int currentRound;

  Round(this.maxRounds, this.currentRound) : super([maxRounds, currentRound]);

  @override
  String toString() =>
      'Round {maxRounds: $maxRounds, currentRound: $currentRound}';
}
