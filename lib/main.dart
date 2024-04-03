import 'package:coursor_tiktok/ui/main_video/video_screen.dart';
import 'package:coursor_tiktok/ui/notifications/notifications_screen.dart';
import 'package:coursor_tiktok/ui/profile/profile_screen.dart';
import 'package:coursor_tiktok/ui/search/search_screen.dart';
import 'package:coursor_tiktok/ui/settings/settings_screen.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: createLightTheme(),
      home: const CoursorTikTok(),
    );
  }
}

class CoursorTikTok extends StatefulWidget {
  const CoursorTikTok({super.key});

  @override
  State<CoursorTikTok> createState() => _CoursorTikTokState();
}

class _CoursorTikTokState extends State<CoursorTikTok>
    with SingleTickerProviderStateMixin {
  late Widget currentScreen;
  late int _selectedIndex;
  late final TabController controller;
  final screens = const [
    SearchScreen(),
    NotificationsScreen(),
    VideoScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];
  void _onItemTapped(int index) {
    _selectedIndex = index;
    currentScreen = screens[_selectedIndex];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 2;
    controller = TabController(
      length: screens.length,
      vsync: this,
      initialIndex: _selectedIndex,
    );
    currentScreen = screens[_selectedIndex];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: TabBar(
        controller: controller,
        onTap: _onItemTapped,
        tabs: const <Tab>[
          Tab(
            icon: Image(image: Svg('assets/icons/chat_icon.svg')),
          ),
          Tab(
            icon: Icon(
              Icons.business,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.business,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.business,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.business,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
