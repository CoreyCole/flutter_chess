import 'models.dart';


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

  static String getRow(int rowNumber) => '${rowNumber + 1}';

  static const ChessBoardData START_STATE = ChessBoardData(
    rows: [
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.ROOK,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.KNIGHT,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.BISHOP,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.QUEEN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.KING,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.BISHOP,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.KNIGHT,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.ROOK,
              color: ChessBoardColor.BLACK,
            )
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.BLACK,
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
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.PAWN,
              color: ChessBoardColor.WHITE,
            )
          ),
        ]
      ),
      ChessBoardRow(
        tiles: [
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.ROOK,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.KNIGHT,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.BISHOP,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.QUEEN,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.KNIGHT,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.BISHOP,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.KNIGHT,
              color: ChessBoardColor.WHITE,
            )
          ),
          ChessBoardTile(
            piece: ChessBoardPiece(
              type: ChessBoardPieceType.ROOK,
              color: ChessBoardColor.WHITE,
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
