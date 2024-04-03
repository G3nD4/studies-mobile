import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/default_appbar.dart';
import 'cubit/search_courses_cubit.dart';
import 'widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Поиск'),
      body: BlocProvider(
        create: (context) => SearchCoursesCubit(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: const SearchField(
                  hintText: 'Начните вводить текст',
                ),
              ),
            ),
            paddingVerticalLarge,
            Text(
              'Популярные курсы',
              style: context.text.appDescription,
            ),
            paddingVerticalLarge
          ],
        ),
      ),
    );
  }
}
