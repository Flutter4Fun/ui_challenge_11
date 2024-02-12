part of '../details_page.dart';

class VariantsWidget extends StatelessWidget {
  const VariantsWidget({
    super.key,
    required this.item,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final WineItem item;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    const spacing = 28.0;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Variants',
                style: TextStyle(
                  color: AppColors.defaultTextColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: Color(0xFF384E6B),
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: spacing),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.variantSelected
                        : AppColors.variantUnselected,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => onItemSelected(index),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        item.images[index].thumbnailImage,
                      ),
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, state) => const SizedBox(width: 18),
            itemCount: item.images.length,
          ),
        )
      ],
    );
  }
}
