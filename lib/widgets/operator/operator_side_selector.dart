import 'package:flutter/material.dart';

class OperatorSideSelector extends StatelessWidget {
  final bool isAttacker;
  const OperatorSideSelector({Key? key, this.isAttacker = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${isAttacker ? 'attacker' : 'defender'}.png',
            height: 30,
          ),
          Text(
            isAttacker ? ' Attackers' : ' Defenders',
          ),
        ],
      ),
    );
  }
}
