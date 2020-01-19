import 'package:flutter/material.dart';

import '../widgets/chess_board.dart';


class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chess'),
        centerTitle: true,
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
