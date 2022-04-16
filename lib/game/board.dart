import 'package:flutter/material.dart';

import 'package:tiktaktu/game/square.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String?> _squares = List.unmodifiable(List.filled(9, null));
  bool _xIsNext = true;

  @override
  Widget build(BuildContext context) {
    final String? winner = _decideWinner(_squares);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Builder(
            builder: (BuildContext context) {
              late final String status;
              if (winner == null) {
                status = 'Next player: ${_xIsNext ? 'X' : 'O'}';
              } else if (winner == 'Draw') {
                status = 'DRAW. Well played!';
              } else {
                status = 'Winner: $winner';
              }
              return Container(
                width: 150.0,
                height: 30.0,
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          Card(
            color: Theme.of(context).primaryColorLight,
            elevation: 10.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildSquare(0),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(width: 8.0),
                        ),
                      ),
                      child: _buildSquare(1),
                    ),
                    _buildSquare(2),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(width: 8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _buildSquare(3),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(width: 8.0),
                          ),
                        ),
                        child: _buildSquare(4),
                      ),
                      _buildSquare(5),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildSquare(6),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(width: 8.0),
                        ),
                      ),
                      child: _buildSquare(7),
                    ),
                    _buildSquare(8),
                  ],
                ),
              ],
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              if (winner == null) {
                return const SizedBox(height: 60.0);
              }
              return Container(
                margin: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: _resetBoard,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSquare(int index) {
    return Square(
      mark: _squares[index],
      onPressed: () {
        if (_squares[index] != null || _decideWinner(_squares) != null) {
          return;
        }
        final List<String?> squares = _squares.toList();
        squares[index] = _xIsNext ? 'X' : 'O';

        setState(() {
          _squares = List.unmodifiable(squares);
          _xIsNext = !_xIsNext;
        });
      },
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

    if (_squares.every((mark) => mark != null)) {
      return 'Draw';
    }
    return null;
  }

  void _resetBoard() {
    final List<String?> squares = List.filled(9, null);
    setState(() {
      _squares = List.unmodifiable(squares);
      _xIsNext = true;
    });
  }
}
