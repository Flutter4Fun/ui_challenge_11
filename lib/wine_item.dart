import 'dart:ui';

class WineItem {
  final String title;
  final String description;
  final List<ImageItem> images;
  final Color color;
  final Color buttonBgColor;
  final Color buttonTextColor;
  final int price;

  String get mainFullSizeImage => images.first.fullSizeImage;

  WineItem({
    required this.title,
    required this.description,
    required this.images,
    required this.color,
    required this.buttonBgColor,
    required this.buttonTextColor,
    required this.price,
  });
}

class ImageItem {
  final String fullSizeImage;
  final String thumbnailImage;

  ImageItem({
    required this.fullSizeImage,
    required this.thumbnailImage,
  });
}

final wineItems = [
  WineItem(
    title: '9% Discount',
    description:
    'A white wine known for its rich, buttery and oaky flavor, it is a versatile wine that can range from light to full-bodied.',
    images: [
      ImageItem(
        fullSizeImage: 'assets/images/item1-1.png',
        thumbnailImage: 'assets/images/item1-1-thumbnail.png',
      ),
      ImageItem(
        fullSizeImage: 'assets/images/item1-2.png',
        thumbnailImage: 'assets/images/item1-2-thumbnail.png',
      ),
      ImageItem(
        fullSizeImage: 'assets/images/item1-3.png',
        thumbnailImage: 'assets/images/item1-3-thumbnail.png',
      ),
      ImageItem(
        fullSizeImage: 'assets/images/item1-4.png',
        thumbnailImage: 'assets/images/item1-4-thumbnail.png',
      ),
      ImageItem(
        fullSizeImage: 'assets/images/item1-5.png',
        thumbnailImage: 'assets/images/item1-5-thumbnail.png',
      ),
    ],
    color: const Color(0xFF3D4D69),
    buttonBgColor: const Color(0xFF243D5E),
    buttonTextColor: const Color(0xFFF4F4F4),
    price: 25,
  ),
  WineItem(
    title: '7% Discount',
    description:
    'A white wine known for its rich, buttery and oaky flavor, it is a versatile wine that can range from light to full-bodied.',
    images: [
      ImageItem(
        fullSizeImage: 'assets/images/item2-1.png',
        thumbnailImage: 'assets/images/item2-1-thumbnail.png',
      ),
    ],
    color: const Color(0xFF3C2E2D),
    buttonBgColor: const Color(0xFF212121),
    buttonTextColor: const Color(0xFFF4F4F4),
    price: 30,
  ),
  WineItem(
    title: '15% Discount',
    description:
    'A white wine known for its rich, buttery and oaky flavor, it is a versatile wine that can range from light to full-bodied.',
    images: [
      ImageItem(
        fullSizeImage: 'assets/images/item3-1.png',
        thumbnailImage: 'assets/images/item3-1-thumbnail.png',
      ),
    ],
    color: const Color(0xFF40474A),
    buttonBgColor: const Color(0xFFF4F4F4),
    buttonTextColor: const Color(0xFF150A0A),
    price: 30,
  ),
];