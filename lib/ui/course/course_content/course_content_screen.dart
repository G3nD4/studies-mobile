import 'package:coursor_tiktok/domain/enums/content_type_enum.dart';
import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/common/default_divider.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/course_content_header.dart';
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
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: CourseContentHeader(
              title: 'Модуль 1. Основы подбора цветов',
              contentType: CourseContentType.education,
            ),
          ),
          const DefaultDivider(),
          paddingVerticalMedium,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: const <Widget>[
                CourseContentWidget(),
                CourseContentWidget(),
              ],
            ),
          ),
          PageIndicator(
            tabController: _tabController,
            currentPageIndex: _currentPageIndex,
            onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
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
}

class PageIndicator extends StatefulWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (widget.currentPageIndex == 0) {
                return;
              }
              widget.onUpdateCurrentPageIndex(widget.currentPageIndex - 1);
              setState(() {});
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              color: AppColors.purple,
              size: 32.0,
            ),
          ),
          Text(
            '${widget.tabController.index + 1}/${widget.tabController.length}',
            style: context.text.labelStyle.copyWith(
              fontSize: 15.0,
              color: AppColors.lightGrey,
            ),
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (widget.currentPageIndex == 1) {
                return;
              }
              widget.onUpdateCurrentPageIndex(widget.currentPageIndex + 1);
              setState(() {});
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              color: AppColors.purple,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
