part of '../home_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.margin,
  });

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        children: [
          AppIconButton(
            iconPath: 'assets/icons/ic_menu.svg',
            onPressed: () {},
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Home',
                style: TextStyle(
                  color: AppColors.defaultTextColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          AppIconButton(
            iconPath: 'assets/icons/ic_scan.svg',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
