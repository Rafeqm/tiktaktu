import 'package:flutter/material.dart';

import 'package:tiktaktu/screens/game.dart';
import 'package:tiktaktu/screens/instruction.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'TikTaktu',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 200.0),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.games, size: 36.0),
                label: const Text('Play', style: TextStyle(fontSize: 36.0)),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColorDark,
                  minimumSize: const Size(100, 50),
                ),
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
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.question_mark),
              label: const Text('How to Play'),
              style: OutlinedButton.styleFrom(
                primary: Colors.blueGrey,
                side: BorderSide(color: Theme.of(context).primaryColorDark),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const InstructionScreen();
                    },
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
