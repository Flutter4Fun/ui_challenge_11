part of '../details_page.dart';

class CounterWidget extends StatefulWidget {
  static const width = 140.0;
  static const height = 54.0;

  const CounterWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CounterWidget.width,
      height: CounterWidget.height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.yellowColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppIconButton(
            iconPath: 'assets/icons/ic_minus.svg',
            onPressed: () {
              if (count <= 0) {
                return;
              }
              setState(() {
                count--;
              });
            },
            bgColor: Colors.transparent,
            fgColor: AppColors.whiteTextColor,
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              color: AppColors.whiteTextColor,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppIconButton(
            iconPath: 'assets/icons/ic_plus.svg',
            onPressed: () {
              setState(() {
                count++;
              });
            },
            bgColor: Colors.transparent,
            fgColor: AppColors.whiteTextColor,
          ),
        ],
      ),
    );
  }
}
