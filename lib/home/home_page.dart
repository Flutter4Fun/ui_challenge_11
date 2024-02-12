import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_challenge_11/app_colors.dart';
import 'package:ui_challenge_11/details/details_page.dart';
import 'package:ui_challenge_11/widgets/app_icon_button.dart';
import 'package:ui_challenge_11/wine_item.dart';

part 'widgets/top_bar.dart';

part '../widgets/bottom_bar.dart';

part 'widgets/wine_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 28.0;
    const bottomBarHeight = 72.0;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(
                margin: const EdgeInsets.only(
                  left: spacing,
                  right: spacing,
                  top: 42,
                ),
                leftIcon: AppIconButton(
                  iconPath: 'assets/icons/ic_menu.svg',
                  onPressed: () {},
                ),
                rightIcon: AppIconButton(
                  iconPath: 'assets/icons/ic_scan.svg',
                  onPressed: () {},
                ),
                title: 'Home',
                titleColor: AppColors.defaultTextColor,
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(spacing),
                  itemCount: wineItems.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: 280,
                      child: WineRow(
                        item: wineItems[index],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                item: wineItems[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, state) => const SizedBox(
                    height: spacing,
                  ),
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(
              height: bottomBarHeight,
            ),
          ),
        ],
      ),
    );
  }
}
