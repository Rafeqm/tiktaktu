import 'package:flutter/material.dart';

import 'package:tiktaktu/board.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.games),
          label: const Text('Play'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Board(),
                maintainState: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
