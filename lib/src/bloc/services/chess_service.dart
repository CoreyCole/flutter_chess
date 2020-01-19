import 'package:rxdart/rxdart.dart';

import '../models.dart';
import '../board_states.dart';


class ChessService {
  final BehaviorSubject<ChessBoardColor> _playerColor = BehaviorSubject<ChessBoardColor>.seeded(null);
  final BehaviorSubject<ChessBoardData> _board = BehaviorSubject<ChessBoardData>.seeded(BoardStates.EMPTY_START_STATE);
  
  Stream<GameState> get state => _playerColor.switchMap((playerColor) => _board.map((board) {
    return GameState(
      playerColor: playerColor,
      board: board,
    );
  }));

  ChessService();

  initBoard(ChessBoardColor playerColor) {
    _playerColor.sink.add(playerColor);
    _board.sink.add(BoardStates.START_STATE);
  }

  dispose() {
    _playerColor.close();
    _board.close();
  }
}




