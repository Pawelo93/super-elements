class GameBoard {

  GameBoard.empty();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GameBoard &&
              runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}