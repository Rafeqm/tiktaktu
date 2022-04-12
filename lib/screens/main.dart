import 'package:flutter/material.dart';

import 'package:tiktaktu/screens/game.dart';
import 'package:tiktaktu/screens/instruction.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'TikTaktu',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 40.0),
                child: Image.asset(
                  'assets/images/main_screen_hero.png',
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.medium,
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.games, size: 36.0),
                label: const Text(
                  'Play',
                  style: TextStyle(fontSize: 36.0),
                ),
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
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: OutlinedButton.icon(
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
