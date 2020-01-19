import 'package:flutter/material.dart';

import '../bloc/provider.dart';
import '../bloc/models.dart';
import '../bloc/board_states.dart';


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
          var rowStartColor = snapshot.hasData
            ? snapshot.data.playerColor
            : ChessBoardColor.WHITE;
          rows.forEach((row) {
            chessBoardRows.add(Expanded(flex: 1, child: Row(
              children: _chessBoardRow(row, rowStartColor),
            )));
            rowStartColor = rowStartColor == ChessBoardColor.WHITE
              ? ChessBoardColor.BLACK
              : ChessBoardColor.WHITE;
          });
          return Column(
            children: chessBoardRows
          );
        }
      )
    );
  }

  List<Widget> _chessBoardRow(ChessBoardRow row, ChessBoardColor rowStartColor) {
    var currentTileColor = rowStartColor;
    return row.tiles.map((tile) {
      final expandedTile = Expanded(flex: 1, child: Container(
        decoration: BoxDecoration(
          color: currentTileColor == ChessBoardColor.WHITE ? Colors.white : Colors.grey,
          border: Border.all(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid  
          )
        ),
        height: double.infinity,
        child: _chessBoardTile(tile),
      ));
      currentTileColor = currentTileColor == ChessBoardColor.WHITE
        ? ChessBoardColor.BLACK
        : ChessBoardColor.WHITE;
      return expandedTile;
    }).toList();
  }

  Widget _chessBoardTile(ChessBoardTile tile) {
    return SizedBox();
  }
}
