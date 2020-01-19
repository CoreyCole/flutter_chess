import 'package:flutter/material.dart';

import '../bloc/provider.dart';
import '../widgets/chess_board.dart';


class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chess'),
        centerTitle: true,
        actions: [
          RaisedButton(
            child: Text('START'),
            color: Colors.red,
            onPressed: () async {
              await bloc.chess.initBoard(ChessBoardColor.BLACK);
            },
          )
        ]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 3, child: ChessBoard()),
          Expanded(flex: 1, child: SizedBox()),
        ]
      )
    );
  }
}
