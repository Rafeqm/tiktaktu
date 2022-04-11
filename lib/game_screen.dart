import 'package:flutter/material.dart';

import 'package:tiktaktu/board.dart';
import 'package:tiktaktu/rules.dart';

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
                title: const Text('How to Play'),
                content: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 2.5,
                      ),
                    ),
                  ),
                  child: const SingleChildScrollView(
                    child: Text(rules),
                  ),
                ),
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
