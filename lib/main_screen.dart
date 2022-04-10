import 'package:flutter/material.dart';

import 'package:tiktaktu/game_screen.dart';
import 'package:tiktaktu/instruction_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.games),
              label: const Text('Play'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const GameScreen(),
                    maintainState: false,
                  ),
                );
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.question_mark),
              label: const Text('How to Play'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const InstructionScreen(),
                    maintainState: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
