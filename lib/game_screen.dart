import 'package:flutter/material.dart';

import 'package:tiktaktu/board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Board(),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.question_mark),
        tooltip: 'How to play?',
        elevation: 3,
        hoverElevation: 4,
        highlightElevation: 6,
        onPressed: () {},
      ),
    );
  }
}
