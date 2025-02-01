class Food {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  List<Addon> availableAddons;
  final FoodCategory category;
  Food(
      {required this.name,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.availableAddons,
      required this.category});
}

class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}

enum FoodCategory { burgers, salads, sides, drinks, desserts }
