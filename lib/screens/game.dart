import 'package:flutter/material.dart';

import 'package:tiktaktu/game/board.dart';
import 'package:tiktaktu/game/rules.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const Board(),
            TextButton.icon(
              icon: const BackButton(color: Colors.blueGrey),
              label: const Text(
                'Main menu',
                style: TextStyle(color: Colors.blueGrey),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.emoji_objects_outlined),
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        foregroundColor: Colors.blueGrey,
        tooltip: 'How to play',
        elevation: 3,
        hoverElevation: 4,
        highlightElevation: 6,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext _context) {
              return AlertDialog(
                title: const Text('How to Play', textAlign: TextAlign.center),
                content: const Text(rulesShort, textAlign: TextAlign.justify),
                contentPadding: const EdgeInsets.fromLTRB(
                  24.0,
                  20.0,
                  24.0,
                  0.0,
                ),
                actions: <Widget>[
                  TextButton.icon(
                    icon: const Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.brown,
                    ),
                    label: const Text(
                      'Got it',
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(_context, rootNavigator: true).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
