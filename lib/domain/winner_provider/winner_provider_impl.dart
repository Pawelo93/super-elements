import 'package:color_game/bloc/board/board_state.dart';
import 'package:color_game/domain/repositories/elements_repository.dart';
import 'package:color_game/domain/winner_provider/winner_provider.dart';
import 'package:color_game/model/game_board_impl.dart';
import 'package:color_game/model/owner_type.dart';

class WinnerProviderImpl implements WinnerProvider {
  final ElementsRepository elementsRepository;

  WinnerProviderImpl(this.elementsRepository);

  List<Winner> winners = [];

  @override
  Winner boardWinner(GameBoardImpl gameBoard) {
    OwnerType ownerType = getWinner(gameBoard);
    Winner winner;
    if (ownerType == OwnerType.PLAYER) {
      winner = Winner.PLAYER;
    } else if (ownerType == OwnerType.COMPUTER) {
      winner = Winner.COMPUTER;
    } else {
      winner = Winner.DRAW;
    }
    winners.add(winner);
    return winner;
  }

  @override
  Winner gameWinner() {
    int playerWinsCounter;
    int computerWinsCounter;
    int drawCounter;
    winners.forEach((winner) {
      if (winner == Winner.PLAYER) {
        playerWinsCounter++;
      } else if (winner == Winner.COMPUTER) {
        computerWinsCounter++;
      } else {
        drawCounter++;
      }
    });
    if (playerWinsCounter > computerWinsCounter &&
        playerWinsCounter > drawCounter) {
      return Winner.PLAYER;
    } else if (computerWinsCounter > playerWinsCounter &&
        computerWinsCounter > drawCounter) {
      return Winner.COMPUTER;
    } else {
      return Winner.DRAW;
    }
  }

  @override
  void clear() {
    winners = [];
  }

  OwnerType whoWonColumn(GameBoardImpl gameBoard, int column) {
    if (getPointsForColumn(gameBoard, column, OwnerType.PLAYER) == 0 &&
        getPointsForColumn(gameBoard, column, OwnerType.COMPUTER) == 0)
      return OwnerType.NO_OWNER;
    else if (getPointsForColumn(gameBoard, column, OwnerType.PLAYER) >
        getPointsForColumn(gameBoard, column, OwnerType.COMPUTER))
      return OwnerType.PLAYER;
    else
      return OwnerType.COMPUTER;
  }

  int getPointsForColumn(
      GameBoardImpl gameBoard, int column, OwnerType ownerType) {
    var points = 0;
    var cellInColumn = 0;

    for (final cellItem in gameBoard.list) {
      if (cellItem.x == column) {
        cellInColumn++;

        var cellPoints =
            elementsRepository.getStrengthByType(cellItem.fieldType);
        if (cellItem.ownerType == ownerType) points += cellPoints;
      }
    }

    if (cellInColumn == gameBoard.width)
      return points;
    else
      return 0;
  }

  OwnerType whoWonRow(GameBoardImpl gameBoard, int row) {
    if (getPointsForRow(gameBoard, row, OwnerType.PLAYER) == 0 &&
        getPointsForRow(gameBoard, row, OwnerType.COMPUTER) == 0)
      return OwnerType.NO_OWNER;
    else if (getPointsForRow(gameBoard, row, OwnerType.PLAYER) >
        getPointsForRow(gameBoard, row, OwnerType.COMPUTER))
      return OwnerType.PLAYER;
    else
      return OwnerType.COMPUTER;
  }

  int getPointsForRow(GameBoardImpl gameBoard, int row, OwnerType ownerType) {
    var points = 0;
    var cellInRow = 0;

    for (final cellItem in gameBoard.list) {
      if (cellItem.y == row) {
        cellInRow++;

        var cellPoints =
            elementsRepository.getStrengthByType(cellItem.fieldType);
        if (cellItem.ownerType == ownerType) points += cellPoints;
      }
    }

    if (cellInRow == gameBoard.width)
      return points;
    else
      return 0;
  }

  OwnerType getWinner(GameBoardImpl gameBoard) {
    List<OwnerType> owners = List();
    for (int i = 0; i < gameBoard.width; i++) {
      owners.add(whoWonRow(gameBoard, i));
    }

    for (int i = 0; i < gameBoard.width; i++) {
      owners.add(whoWonColumn(gameBoard, i));
    }

    var computerWins = 0;
    var playerWins = 0;

    for (final owner in owners) {
      if (owner == OwnerType.PLAYER)
        playerWins++;
      else if (owner == OwnerType.COMPUTER) computerWins++;
    }

    if (playerWins > computerWins)
      return OwnerType.PLAYER;
    else if (computerWins > playerWins)
      return OwnerType.COMPUTER;
    else
      return OwnerType.NO_OWNER;
  }
}
