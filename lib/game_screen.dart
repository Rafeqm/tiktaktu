import 'package:flutter/material.dart';

import 'package:tiktaktu/board.dart';
import 'package:tiktaktu/rules.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Board(),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.question_mark),
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
                  TextButton(
                    onPressed: () {
                      Navigator.of(_context, rootNavigator: true).pop();
                    },
                    child: const Text('OK'),
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
