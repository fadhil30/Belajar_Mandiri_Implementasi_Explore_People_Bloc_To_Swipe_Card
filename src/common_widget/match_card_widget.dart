import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';

import '../features/likes_you/domain/user.dart';
import 'glass_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  user.imagePath,
                ),
              ),
              border: Border.all(
                  width: 10,
                  color: ColorManager.secondary,
                  strokeAlign: BorderSide.strokeAlignInside),
              borderRadius: BorderRadius.circular(70)),
        ),
        GlassCardWidget(
          user: user,
        ),
      ],
    );
  }
}
