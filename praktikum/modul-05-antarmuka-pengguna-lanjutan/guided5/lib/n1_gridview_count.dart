import 'package:flutter/material.dart';

class N1GridViewCount extends StatelessWidget {
  const N1GridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        for (int index = 0; index < 150; index++)
          Container(
            color: Colors.red[100 * ((index % 8) + 1)],
            child: Text("$index"),
          ),
      ],
    );
  }
}
