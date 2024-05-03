import 'package:coursor_tiktok/auth/authorization_controller.dart';
import 'package:coursor_tiktok/domain/enums/user_type.dart';
import 'package:coursor_tiktok/routing/route_generator.dart';
import 'package:coursor_tiktok/test_data.dart';
import 'package:coursor_tiktok/ui/common/video_uploader.dart';
import 'package:coursor_tiktok/ui/notifications/notifications_screen.dart';
import 'package:coursor_tiktok/ui/profile/admin/admin_profile.dart';
import 'package:coursor_tiktok/ui/search/search_screen.dart';
import 'package:coursor_tiktok/ui/settings/settings_screen.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/services/auth/api.dart';
import 'permissions/storage_permissions.dart';
import 'ui/common/video_picker_widget.dart';
import 'ui/main_video/video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ask for storage permission
  // await storagePermission();

  // // await API().register(testRegisterModerator);
  // await API().uploadVideo(UserType.moderators);

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
        onTap: onTabTapped,
        tabs: <Tab>[
          const Tab(
            icon: Icon(
              Icons.search_sharp,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          const Tab(
            icon: Icon(
              Icons.notifications_none,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          mainTab(_selectedIndex),
          const Tab(
            icon: Icon(
              Icons.person_2_outlined,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          const Tab(
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

  Tab mainTab(int index) {
    return Tab(
      icon: Icon(
        index == 2 ? CupertinoIcons.add : Icons.play_circle,
        color: AppColors.purple,
        size: 40.0,
      ),
    );
  }

  void onTabTapped(int index) {
    if (index == _selectedIndex && index == 2) {
      VideoUploader(context, communityId: 0).upload();
    } else {
      setState(() {
        _selectedIndex = index;
        _tabController.animateTo(index);
        _pageController.jumpToPage(index);
      });
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
  }
}
