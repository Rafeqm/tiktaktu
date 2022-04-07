import 'package:flutter/material.dart';

void main() => runApp(const TiktaktuApp());

class TiktaktuApp extends StatelessWidget {
  const TiktaktuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Board(),
    );
  }
}

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final List<String?> _squares = List.filled(9, null);
  bool _xIsNext = true;

  Widget _buildSquare(int index) {
    return Square(
      onPressed: () {
        if (_squares[index] != null || _decideWinner(_squares) != null) {
          return;
        }
        setState(() {
          _squares[index] = _xIsNext ? 'X' : 'O';
          _xIsNext = !_xIsNext;
        });
      },
      mark: _squares[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? winner = _decideWinner(_squares);
    late final String status;
    if (winner != null) {
      status = 'Winner: $winner';
    } else {
      status = 'Next player: ${_xIsNext ? 'X' : 'O'}';
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildSquare(0),
                _buildSquare(1),
                _buildSquare(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildSquare(3),
                _buildSquare(4),
                _buildSquare(5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildSquare(6),
                _buildSquare(7),
                _buildSquare(8),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(status),
            ),
          ],
        ),
      ),
    );
  }

  String? _decideWinner(List<String?> squares) {
    const List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (List<int> line in lines) {
      int a = line[0];
      int b = line[1];
      int c = line[2];

      if (squares[a] != null &&
          squares[a] == squares[b] &&
          squares[a] == squares[c]) {
        return squares[a];
      }
    }
    return null;
  }
}

class Square extends StatelessWidget {
  const Square({
    Key? key,
    required this.onPressed,
    required this.mark,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? mark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      width: 100.0,
      height: 100.0,
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            mark ?? ' ',
            textScaleFactor: 5.0,
          ),
        ),
      ),
    );
  }
}
