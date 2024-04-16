import 'package:coursor_tiktok/auth/authorization_controller.dart';
import 'package:coursor_tiktok/routing/route_generator.dart';
import 'package:coursor_tiktok/ui/notifications/notifications_screen.dart';
import 'package:coursor_tiktok/ui/profile/admin/admin_profile.dart';
import 'package:coursor_tiktok/ui/search/search_screen.dart';
import 'package:coursor_tiktok/ui/settings/settings_screen.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'domain/models/course_model.dart';
import 'ui/course/course_content/course_content_screen.dart';
import 'ui/course/course_screen.dart';
import 'ui/course/redact_course/redact_course_screen.dart';
import 'ui/main_video/video_screen.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const AuthorizationController(),
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
  final screens = [
    const SearchScreen(),
    const NotificationsScreen(),
    // const CourseContentScreen(),
    const VideoScreen(),
    // CourseScreen(
    //   course: Course(
    //     id: 1,
    //     title: 'G3nD4 course',
    //     description:
    //         'Я крутой Я крутой Я крутой Я крутой Я крутой Я крутой Я крутой Я крутой Я крутой Я крутой',
    //   ),
    // ),
    const AdminProfileScreen(),
    const SettingsScreen(),
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
      backgroundColor: _selectedIndex == 2 ? AppColors.black : null,
      bottomNavigationBar: TabBar(
        indicatorColor: AppColors.purple,
        indicatorPadding: const EdgeInsets.only(bottom: 4.0),
        controller: controller,
        onTap: _onItemTapped,
        tabs: const <Tab>[
          Tab(
            icon: Image(
              height: 100,
              image: Svg('assets/icons/chat_icon.svg'),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.notifications_none,
              color: AppColors.grey,
              size: 36.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.play_circle,
              color: AppColors.purple,
              size: 36.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person_2_outlined,
              color: AppColors.grey,
              size: 36.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.settings_outlined,
              color: AppColors.grey,
              size: 36.0,
            ),
          ),
        ],
      ),
    );
  }
}
