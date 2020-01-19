class GameState {
  final bool playing;
  final ChessBoardColor playerColor;
  final ChessBoardData board;

  GameState({
    this.playing,
    this.playerColor,
    this.board,
  });
}

class ChessBoardData {
  final List<ChessBoardRow> rows;

  const ChessBoardData({
    this.rows,
  });
}

class ChessBoardRow {
  final List<ChessBoardTile> tiles;

  const ChessBoardRow({
    this.tiles,
  });
}

class ChessBoardTile {
  final ChessBoardPiece piece;

  const ChessBoardTile({
    this.piece,
  });
}

class ChessBoardPiece {
  final ChessBoardPieceType type;
  final ChessBoardColor color;

  const ChessBoardPiece({
    this.type,
    this.color,
  });
}

enum ChessBoardPieceType {
  KING,
  QUEEN,
  ROOK,
  BISHOP,
  KNIGHT,
  PAWN,
}

enum ChessBoardColor {
  WHITE,
  BLACK,
}
