import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(
        title: 'Nadia Tambunan - 103122400005',
        style: TextStyle(fontSize: 11),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.style});

  final String title;
  final TextStyle style;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRow(),
            buildContainer(),
            buildBentukGambar(),
            buildIconLeadingTrailingListTile(),
          ],
        ),
        // child: Text(
        //   'Ini adalah contoh teks yang cukup panjang sehingga melebihi lebar layar',
        //   textAlign: TextAlign.center,
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 1,
        //   style: TextStyle(
        //     fontSize: 16,
        //     color: Colors.deepPurple,
        //     fontStyle: FontStyle.italic,
        //     letterSpacing: 2.0,
        //   ),
        // ),
      ),
    );
  }

  Widget buildImage() {
    return Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA--7oZB_8h8O9bSBeMBq-lndA7TwY9jMBppuWUILMlEgJ6A2uQnlpvawE&s=10',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
  }

  Widget buildBentukGambar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: buildImage(),
    );
  }

  Widget buildIcon() {
    return const Icon(
      Icons.search,
      color: Color.fromARGB(255, 52, 4, 1),
      size: 50,
    );
  }

  Widget buildIconButton() {
    return IconButton(
      icon: const Icon(Icons.search),
      color: Colors.deepPurple,
      iconSize: 50,
      onPressed: () {
        // Aksi yang akan dilakukan saat tombol ditekan
        print('Tombol ditekan!');
      },
    );
  }

  Widget buildIconFontAwesome() {
    return const FaIcon(
      FontAwesomeIcons.instagram,
      color: Color.fromARGB(255, 103, 3, 3),
      size: 50,
    );
  }

  Widget buildIconLeadingTrailingListTile() {
    return ListTile(
      leading: const Icon(Icons.account_circle),
      title: const Text('Nadia Tambunan'),
      subtitle: const Text('103122400005 - SE0801'),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          // Aksi yang akan dilakukan saat tombol ditekan
          print('Tombol ditekan!');
        },
      ),
    );
  }

  Widget buildContainer() {
    return Container(
      width: 200,
      height: 200,
      child: const Center(
        child: Text(
          'Ini adalah contoh teks di dalam Container',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Widget buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [buildIcon(), buildIconButton(), buildIconFontAwesome()],
    );
  }
}
