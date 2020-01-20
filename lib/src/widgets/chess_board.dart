import 'package:flutter/material.dart';

import '../bloc/provider.dart';
import '../bloc/models.dart';


class ChessBoard extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid  
        )
      ),
      width: double.infinity,
      child: StreamBuilder(
        stream: bloc.chess.state,
        builder: (context, AsyncSnapshot<GameState> snapshot) {
          final List<ChessBoardRow> rows = snapshot.hasData
            ? snapshot.data.board.rows
            : BoardStates.EMPTY_START_STATE.rows;
          final List<Widget> chessBoardRows = [];
          final whitePlayer = snapshot.hasData && snapshot.data.playerColor != null
            ? snapshot.data.playerColor == ChessBoardColor.WHITE
            : true;
          ChessBoardColor rowStartColor = whitePlayer
            ? ChessBoardColor.WHITE
            : ChessBoardColor.BLACK;
          int rowNumber = whitePlayer
            ? 8
            : 0;
          final colorDependentRows = whitePlayer
            ? rows
            : rows.reversed.toList();
          colorDependentRows.forEach((row) {
            chessBoardRows.add(Expanded(flex: 1, child: Row(
              children: _chessBoardRow(row, rowStartColor, rowNumber),
            )));
            rowStartColor = rowStartColor == ChessBoardColor.WHITE
              ? ChessBoardColor.BLACK
              : ChessBoardColor.WHITE;
            if (whitePlayer) {
              rowNumber--;
            } else {
              rowNumber++;
            }
          });
          return Column(
            children: chessBoardRows
          );
        }
      )
    );
  }

  List<Widget> _chessBoardRow(ChessBoardRow row, ChessBoardColor rowStartColor, int rowNumber) {
    ChessBoardColor currentTileColor = rowStartColor;
    int columnNumber = 0;
    return row.tiles.map((tile) {
      final expandedTile = Expanded(flex: 1, child: Container(
        decoration: BoxDecoration(
          color: currentTileColor == ChessBoardColor.WHITE
            ? Colors.white 
            : Colors.grey,
          border: Border.all(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid  
          )
        ),
        height: double.infinity,
        child: _chessBoardTile(tile, rowNumber, columnNumber),
      ));
      currentTileColor = currentTileColor == ChessBoardColor.WHITE
        ? ChessBoardColor.BLACK
        : ChessBoardColor.WHITE;
      columnNumber++;
      return expandedTile;
    }).toList();
  }

  Widget _chessBoardTile(ChessBoardTile tile, int rowNumber, int columnNumber) {
    if (tile.piece == null) return SizedBox();
    return GestureDetector(
      onTap: () {
        print(tile.piece.toString());
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Text(tile.piece.type.toString()),
      )
    );
  }
}
