import 'package:flutter/material.dart';

class N1GridViewBuilder extends StatelessWidget {
  const N1GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List buah = ["Apel", "Jeruk", "Mangga", "Pisang", "Semangka"];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.red[100 * ((index % 8) + 1)],
        child: Text(buah[index]),
      ),
      itemCount: buah.length,
    );
  }
}
