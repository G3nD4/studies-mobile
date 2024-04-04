import 'package:flutter/material.dart';

import '../../common/circle_avatar.dart';
import '../../themes/theme.dart';

class ChangeProfileWidget extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  ChangeProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _changeProfilePicture(),
        paddingVerticalMedium,
        Text('Профиль', style: context.text.appDescription),
        paddingVerticalMedium,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _changeProfileCredentals(context),
        ),
      ],
    );
  }

  _changeProfilePicture() {
    return Stack(
      children: [
        const DefaultCircleAvatar(
          radius: 40.0,
        ),
        Positioned.fill(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  _changeProfileCredentals(BuildContext context) {
    var children = <Widget>[
      TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.veryLightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          hintText: '@G3nD4',
          hintStyle: context.text.searchHint,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
      paddingVerticalMedium,
      TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.veryLightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'Adel Shagaliev',
          hintStyle: context.text.searchHint,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
      paddingVerticalMedium,
      TextFormField(
        controller: phoneNumberController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.veryLightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          hintText: '+7 (987) 287 81 65',
          hintStyle: context.text.searchHint,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    ];

    return Column(children: children);
  }
}
