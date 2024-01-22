import 'package:flutter/material.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final List<Widget>? actions;
  const CustomAppbar({required this.text, this.actions, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leadingWidth: 10,
        toolbarHeight: 80,
        leading: const SizedBox.shrink(),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: FontSystem.initTextStyle.copyWith(fontSize: 23),
            ),
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.fromLTRB(3, 0, 0, 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorSystem.main1),
            ),
          ],
        ),
        actions: actions,
        scrolledUnderElevation: 0,
        backgroundColor: ColorSystem.backgroundColor,
      ),
    );
  }
}
