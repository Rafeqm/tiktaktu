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
  final List<dynamic> _squares = List.filled(9, null);

  Widget _buildSquare(int index) {
    return Square(
      onPressed: () => setState(() {
        _squares[index] = 'X';
      }),
      mark: _squares[index],
    );
  }

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
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
