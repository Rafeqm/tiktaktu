import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  const Square({
    Key? key,
    required this.mark,
    required this.onPressed,
  }) : super(key: key);

  final String? mark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100.0,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (mark == null) {
                return const SizedBox();
              }
              return Icon(
                mark == 'X'
                    ? Icons.cancel_presentation
                    : Icons.motion_photos_on,
                size: constraints.maxWidth,
                color: Colors.brown,
              );
            },
          ),
        ),
      ),
    );
  }
}
