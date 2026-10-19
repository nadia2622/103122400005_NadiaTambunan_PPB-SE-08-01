import 'package:flutter/material.dart';

class N1GridViewExtends extends StatelessWidget {
  const N1GridViewExtends({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: [
        for (int index = 0; index < 150; index++)
          Container(
            color: Colors.purple[100 * ((index % 8) + 1)],
            child: Text("$index"),
          ),
      ],
    );
  }
}
