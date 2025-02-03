import 'food.dart';

class CartItem {
  final Food food;
  int quantity;
  final List<Addon> selectedAddons;

  CartItem(
      {required this.food, required this.selectedAddons, this.quantity = 1});

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
