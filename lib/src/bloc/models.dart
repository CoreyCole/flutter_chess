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

class TilePosition {
  final int x;
  final int y;

  const TilePosition({ this.x, this.y });

  bool get valid => x >= 0 && x < 8 && y >= 0 && y < 8;

  static TilePosition translate(TilePosition pos, int transX, int transY) {
    return TilePosition(
      x: pos.x + transX,
      y: pos.y + transY,
    );
  }
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

abstract class ChessBoardPiece {
  final ChessBoardPieceType type;
  final ChessBoardColor color;
  final TilePosition pos;

  List<TilePosition> getMoves();

  List<TilePosition> getLateralMoves() {
    final List<TilePosition> positions = [];
    for (int i = 0; i < 8; i++) {
      positions.add(TilePosition(
        x: pos.x,
        y: i
      ));
      positions.add(TilePosition(
        x: i,
        y: pos.y
      ));
    }
    return positions;
  }

  List<TilePosition> getDiagonalMoves() {
    final List<TilePosition> positions = [];
    TilePosition currentPos = TilePosition.translate(pos, -1, -1);
    while (currentPos.valid) {
      positions.add(currentPos);
      currentPos = TilePosition.translate(currentPos, -1, -1);
    }
    currentPos = TilePosition.translate(pos, 1, 1);
    while (currentPos.valid) {
      positions.add(currentPos);
      currentPos = TilePosition.translate(currentPos, 1, 1);
    }
    currentPos = TilePosition.translate(pos, 1, -1);
    while (currentPos.valid) {
      positions.add(currentPos);
      currentPos = TilePosition.translate(currentPos, 1, -1);
    }
    currentPos = TilePosition.translate(pos, -1, -1);
    while (currentPos.valid) {
      positions.add(currentPos);
      currentPos = TilePosition.translate(pos, -1, -1);
    }
    return positions;
  }

  String toString() {
    final x = BoardStates.getColumn(pos.x);
    final y = BoardStates.getRow(pos.y);
    final sColor = color.toString().split('.').last;
    final sType = type.toString().split('.').last;
    return '[$x, $y]: $sColor $sType';
  }

  const ChessBoardPiece({
    this.type,
    this.color,
    this.pos,
  });
}

class PawnPiece extends ChessBoardPiece {
  final type = ChessBoardPieceType.PAWN;
  final ChessBoardColor color;
  final TilePosition pos;

  List<TilePosition> getMoves() {
    final List<TilePosition> positions = [];
    final yDirection = color == ChessBoardColor.WHITE ? 1 : -1;
    final startingPosition = (color == ChessBoardColor.WHITE && pos.y == 1)
      || ( color == ChessBoardColor.BLACK && pos.y == 7);
    if (startingPosition) positions.add(TilePosition.translate(pos, 0, yDirection * 2));
    positions.add(TilePosition.translate(pos, 0, yDirection));
    positions.add(TilePosition.translate(pos, -1, yDirection));
    positions.add(TilePosition.translate(pos, 1, yDirection));
    return positions;
  }

  const PawnPiece({
    this.color,
    this.pos,
  });
}

class RookPiece extends ChessBoardPiece {
  final type = ChessBoardPieceType.ROOK;
  final ChessBoardColor color;
  final TilePosition pos;

  getMoves() {
    return getLateralMoves();
  }

  const RookPiece({
    this.color,
    this.pos,
  });
}

class BishopPiece extends ChessBoardPiece {
  final type = ChessBoardPieceType.BISHOP;
  final ChessBoardColor color;
  final TilePosition pos;

  getMoves() {
    return getDiagonalMoves();
  }

  const BishopPiece({
    this.color,
    this.pos,
  });
}

class QueenPiece extends ChessBoardPiece {
  final type = ChessBoardPieceType.QUEEN;
  final ChessBoardColor color;
  final TilePosition pos;

  getMoves() {
    return [...getDiagonalMoves(), ...getLateralMoves()];
  }

  const QueenPiece({
    this.color,
    this.pos,
  });
}

class KnightPiece extends ChessBoardPiece {
  final type = ChessBoardPieceType.KNIGHT;
  final ChessBoardColor color;
  final TilePosition pos;

  getMoves() {
    final List<TilePosition> positions = [];
    positions.add(TilePosition.translate(pos, -1,  2));
    positions.add(TilePosition.translate(pos,  1,  2));
    positions.add(TilePosition.translate(pos, -2,  1));
    positions.add(TilePosition.translate(pos,  2,  1));
    positions.add(TilePosition.translate(pos, -2, -1));
    positions.add(TilePosition.translate(pos,  2, -1));
    positions.add(TilePosition.translate(pos, -2, -1));
    positions.add(TilePosition.translate(pos, -2,  1));
    return positions;
  }

  const KnightPiece({
    this.color,
    this.pos,
  });
}

class KingPiece extends ChessBoardPiece {
  final type = ChessBoardPieceType.KING;
  final ChessBoardColor color;
  final TilePosition pos;
  
  getMoves() {
    final List<TilePosition> positions = [];
    positions.add(TilePosition.translate(pos,  1,  1));
    positions.add(TilePosition.translate(pos, -1, -1));
    positions.add(TilePosition.translate(pos,  1, -1));
    positions.add(TilePosition.translate(pos, -1,  1));
    return positions;
  }

  const KingPiece({
    this.color,
    this.pos,
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

class BoardStates {
  static String getColumn(int columnNumber) {
    return (columnNumber == 0) ? 'a'
      : (columnNumber == 1) ? 'b'
      : (columnNumber == 1) ? 'c'
      : (columnNumber == 1) ? 'd'
      : (columnNumber == 1) ? 'e'
      : (columnNumber == 1) ? 'f'
      : (columnNumber == 1) ? 'g'
      : (columnNumber == 1) ? 'h'
      : 'X';
  }

  static int getColumnIndex(String column) {
    return (column == 'a') ? 0
      : (column == 'b') ? 1
      : (column == 'c') ? 2
      : (column == 'd') ? 3
      : (column == 'e') ? 4
      : (column == 'f') ? 5
      : (column == 'g') ? 6
      : (column == 'h') ? 7
      : -1;
  }

  static String getRow(int rowNumber) => '${rowNumber + 1}';

  static int getRowIndex(String row) {
    try {
      final intRow = int.parse(row);
      return intRow - 1;
    } catch (err, stack) {
      print('$err\n$stack');
      throw err;
    }
  }

  static const ChessBoardData START_STATE = ChessBoardData(
    rows: [
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: RookPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 0, y: 7),
            )
          ),
          ChessBoardTile(
            piece: KnightPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 1, y: 7),
            )
          ),
          ChessBoardTile(
            piece: BishopPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 2, y: 7),
            )
          ),
          ChessBoardTile(
            piece: QueenPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 3, y: 7),
            )
          ),
          ChessBoardTile(
            piece: KingPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 4, y: 7),
            )
          ),
          ChessBoardTile(
            piece: BishopPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 5, y: 7),
            )
          ),
          ChessBoardTile(
            piece: KnightPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 6, y: 7),
            )
          ),
          ChessBoardTile(
            piece: RookPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 7, y: 7),
            )
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 0, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 1, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 2, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 3, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 4, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 5, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 6, y: 6),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.BLACK,
              pos: TilePosition(x: 7, y: 6),
            )
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 0, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 1, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 2, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 3, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 4, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 5, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 6, y: 1),
            )
          ),
          ChessBoardTile(
            piece: PawnPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 7, y: 1),
            )
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: RookPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 0, y: 0),
            )
          ),
          ChessBoardTile(
            piece: KnightPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 1, y: 0),
            )
          ),
          ChessBoardTile(
            piece: BishopPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 2, y: 0),
            )
          ),
          ChessBoardTile(
            piece: QueenPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 3, y: 0),
            )
          ),
          ChessBoardTile(
            piece: KnightPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 4, y: 0),
            )
          ),
          ChessBoardTile(
            piece: BishopPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 5, y: 0),
            )
          ),
          ChessBoardTile(
            piece: KnightPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 6, y: 0),
            )
          ),
          ChessBoardTile(
            piece: RookPiece(
              color: ChessBoardColor.WHITE,
              pos: TilePosition(x: 7, y: 0),
            )
          ),
        ]
      ),
    ]
  );

  static const ChessBoardData EMPTY_START_STATE = ChessBoardData(
    rows: [
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
          ChessBoardTile(
            piece: null,
          ),
        ]
      ),
    ]
  );
}
