import 'package:flutter/material.dart';

import 'package:tiktaktu/rules.dart';

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
                  'assets/images/instruction_cover_image.jpeg',
                  filterQuality: FilterQuality.medium,
                ),
                const SafeArea(
                  child: CircleAvatar(
                    child: BackButton(),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(rules),
            ),
          ],
        ),
      ),
    );
  }
}
