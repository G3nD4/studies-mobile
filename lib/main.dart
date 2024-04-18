import 'package:coursor_tiktok/auth/authorization_controller.dart';
import 'package:coursor_tiktok/routing/route_generator.dart';
import 'package:coursor_tiktok/ui/notifications/notifications_screen.dart';
import 'package:coursor_tiktok/ui/profile/admin/admin_profile.dart';
import 'package:coursor_tiktok/ui/search/search_screen.dart';
import 'package:coursor_tiktok/ui/settings/settings_screen.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
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
  late int _selectedIndex;
  late final TabController _tabController;
  late final PageController _pageController;

  final screens = [
    const SearchScreen(),
    const NotificationsScreen(),
    const VideoScreen(),
    const AdminProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 2;
    _tabController = TabController(
      length: screens.length,
      vsync: this,
      initialIndex: _selectedIndex,
    );
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: screens,
      ),
      backgroundColor: _selectedIndex == 2 ? AppColors.black : null,
      bottomNavigationBar: TabBar(
        dividerColor: AppColors.black,
        indicatorColor: AppColors.purple,
        indicatorPadding: const EdgeInsets.only(bottom: 4.0),
        controller: _tabController,
        onTap: _onPageChanged,
        tabs: const <Tab>[
          Tab(
            icon: Icon(
              Icons.search_sharp,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.notifications_none,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.play_circle,
              color: AppColors.purple,
              size: 40.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person_2_outlined,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.settings_outlined,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
      _pageController.jumpToPage(index);
    });
  }
}
