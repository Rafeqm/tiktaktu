import 'package:flutter/material.dart';

import 'package:tiktaktu/game/rules.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/instruction_cover_image.jpg',
                  filterQuality: FilterQuality.medium,
                ),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Theme.of(context).backgroundColor,
                      child: const BackButton(),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: const Text(
                'TikTaktu',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 18.0),
              child: const Text(rules, textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}
