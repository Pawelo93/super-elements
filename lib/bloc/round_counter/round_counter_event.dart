import 'package:equatable/equatable.dart';

abstract class RoundCounterEvent extends Equatable {

  RoundCounterEvent([List props = const []]) : super(props);
}

class Setup extends RoundCounterEvent {
  final int maxRounds;

  Setup(this.maxRounds) : super([maxRounds]);

  @override
  String toString() => 'Setup {maxRounds: $maxRounds}';
}

class NextRound extends RoundCounterEvent {
  final int nextRound;

  NextRound(this.nextRound) : super([nextRound]);

  @override
  String toString() => 'NextRound {nextRound: $nextRound}';
}