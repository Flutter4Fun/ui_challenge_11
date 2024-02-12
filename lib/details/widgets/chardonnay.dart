part of '../details_page.dart';

class Chardonnay extends StatelessWidget {
  const Chardonnay({
    super.key,
    required this.item,
  });

  final WineItem item;

  @override
  Widget build(BuildContext context) {
    const spacing = 28.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chardonnay',
            style: TextStyle(
              color: AppColors.defaultTextColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: const TextStyle(
              color: AppColors.descriptionTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}