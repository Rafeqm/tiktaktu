import 'package:flutter/material.dart';

import 'package:tiktaktu/rules.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(rules),
      ),
    );
  }
}
