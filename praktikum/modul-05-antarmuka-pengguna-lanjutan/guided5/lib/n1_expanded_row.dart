import 'package:flutter/material.dart';

class N1ExpandedRow extends StatelessWidget {
  const N1ExpandedRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Expanded Row Content'),
        ),
      ),
    );
  }
}
