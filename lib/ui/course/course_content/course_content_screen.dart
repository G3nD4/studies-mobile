import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/common/default_divider.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'widgets/course_content_widget.dart';

class CourseContentScreen extends StatefulWidget {
  const CourseContentScreen({super.key});

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Страница курса',
        implyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: _buildCourseHeader(context),
          ),
          const DefaultDivider(),
          paddingVerticalMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: PageView(
                    controller: _pageViewController,
                    onPageChanged: _handlePageViewChanged,
                    children: const <Widget>[
                      CourseContentWidget(),
                      CourseContentWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: PageIndicator(
                    tabController: _tabController,
                    currentPageIndex: _currentPageIndex,
                    onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                    isOnDesktopAndWeb: _isOnDesktopAndWeb,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

  _buildCourseHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Теория 1. Основы опдбора цветов',
              style: context.text.appDescription.copyWith(fontSize: 15.0),
            ),
            paddingVerticalMedium,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  color: AppColors.lightGrey,
                ),
                paddingHorizontalSmall,
                Text(
                  'Открыто 24.02.2023' '\nБессрочно',
                  style: context.text.appDescription.copyWith(
                    fontSize: 10.0,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.background,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 1) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
