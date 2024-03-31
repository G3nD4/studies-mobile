import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Comfortaa',
        useMaterial3: true,
      ),
      home: const CoursorTikTok(),
    );
  }
}

class CoursorTikTok extends StatefulWidget {

  const CoursorTikTok({super.key});

  @override
  State<CoursorTikTok> createState() => _CoursorTikTokState();
}

class _CoursorTikTokState extends State<CoursorTikTok> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Hello, World!',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(image: Svg('assets/icons/chat_icon.svg')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
        ],
      ),
    );
  }
}
