import 'package:flutter/material.dart';

class BuilderListView extends StatelessWidget {
  const BuilderListView({super.key});

  @override
  Widget build(BuildContext context) {
    const mobil = ["BMW", "Toyota", "Honda", "Mitsubishi", "Suzuki"];

    return ListView.builder(
      itemCount: mobil.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 115, 237, 117),
            child: Text(mobil[index][0]),
          ),
          title: Text(mobil[index]),
        );
      },
    );
  }
}
