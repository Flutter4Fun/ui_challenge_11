import 'package:flutter/material.dart';
import 'package:ui_challenge_11/app_colors.dart';
import 'package:ui_challenge_11/home/home_page.dart';
import 'package:ui_challenge_11/widgets/app_icon_button.dart';
import 'package:ui_challenge_11/wine_item.dart';

part 'widgets/counter_widget.dart';

part 'widgets/variants_widget.dart';

part 'widgets/chardonnay.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.item,
  });

  final WineItem item;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedVariantIndex = 0;

  @override
  Widget build(BuildContext context) {
    const spacing = 28.0;
    const topBarHeight = 80.0;
    const topBoxHeight = 400.0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: topBoxHeight,
            ),
            child: ListView(
              children: [
                const SizedBox(height: 32),
                VariantsWidget(
                  item: widget.item,
                  selectedIndex: selectedVariantIndex,
                  onItemSelected: (newIndex) {
                    setState(() {
                      selectedVariantIndex = newIndex;
                    });
                  },
                ),
                const SizedBox(height: spacing),
                Chardonnay(item: widget.item),
              ],
            ),
          ),
          Container(
            height: topBoxHeight,
            decoration: BoxDecoration(
              color: widget.item.color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Align(
              alignment: const Alignment(0, 0.5),
              child: Hero(
                tag: widget.item.mainFullSizeImage,
                child: Image.asset(
                  widget.item.images[selectedVariantIndex].fullSizeImage,
                  width: double.infinity,
                  height: topBoxHeight * 0.6,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: topBarHeight,
              child: TopBar(
                margin: const EdgeInsets.only(
                  left: spacing,
                  right: spacing,
                  top: 42,
                ),
                leftIcon: AppIconButton(
                  iconPath: 'assets/icons/ic_arrow_back.svg',
                  onPressed: () => Navigator.of(context).pop(),
                  fgColor: Colors.white,
                  bgColor: AppColors.detailsIconBg,
                ),
                rightIcon: AppIconButton(
                  iconPath: 'assets/icons/ic_menu.svg',
                  onPressed: () {},
                  fgColor: Colors.white,
                  bgColor: AppColors.detailsIconBg,
                ),
                title: 'Item',
                titleColor: AppColors.whiteTextColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: topBoxHeight - (CounterWidget.height / 2),
              ),
              child: CounterWidget(
                color: widget.item.color,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(spacing),
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: AppColors.yellowColor,
                  onPressed: () {},
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ),
                  child: Text(
                    'Pay ${widget.item.price} to buy',
                    style: const TextStyle(
                      color: AppColors.whiteTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
