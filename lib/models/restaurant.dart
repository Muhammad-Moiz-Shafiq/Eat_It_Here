import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  //List of food
  final List<Food> _menu = [
    //burgers
    Food(
        name: 'Cheese Burger',
        description:
            'Fresh Cheese Burger with onion, 100g chicken patty, and veggies',
        price: 1.99,
        imagePath: 'assets/images/burgers/cheeseburger.jpg',
        availableAddons: [
          Addon(name: 'Onion Rings', price: 0.50),
          Addon(name: 'Extra Patty', price: 0.99)
        ],
        category: FoodCategory.burgers),
    Food(
        name: "Chef's Special Beef Burger",
        description:
            "Juicy beef patty with special sauce,cheese and fresh veggies",
        price: 6.99,
        imagePath: "assets/images/burgers/Chefs_special.jpg",
        availableAddons: [
          Addon(name: "Extra Cheese Slice", price: 0.50),
          Addon(name: "Extra Patty", price: 1.50)
        ],
        category: FoodCategory.burgers),
    Food(
        name: "Beef Burger",
        description: "Classic beef burger with lettuce, tomato, and mayo",
        price: 4.99,
        imagePath: "assets/images/burgers/beefburger.jpg",
        availableAddons: [
          Addon(name: "Bacon", price: 1.00),
          Addon(name: "Extra Sauce", price: 0.30)
        ],
        category: FoodCategory.burgers),
    Food(
        name: "Mushroom Swiss Burger",
        description:
            "Classic beef burger with mushrooms, lettuce, tomato, and cheese.",
        price: 4.99,
        imagePath: "assets/images/burgers/mushroom_swiss_burger.jpg",
        availableAddons: [
          Addon(name: "Bacon", price: 1.00),
          Addon(name: "Extra Sauce", price: 0.30)
        ],
        category: FoodCategory.burgers),
    Food(
        name: "Regular Burger",
        description: "Simple and tasty burger with fresh ingredients",
        price: 3.99,
        imagePath: "assets/images/burgers/regularBurger.jpg",
        availableAddons: [
          Addon(name: "Lettuce", price: 0.25),
          Addon(name: "Tomato", price: 0.25)
        ],
        category: FoodCategory.burgers),
    Food(
        name: "Chicken Dopamine",
        description: "Crispy chicken patty with spicy sauce and pickles",
        price: 5.49,
        imagePath: "assets/images/burgers/chicken_dopamine.jpg",
        availableAddons: [
          Addon(name: "Jalapeños", price: 0.75),
          Addon(name: "Extra Cheese", price: 0.50)
        ],
        category: FoodCategory.burgers),

    // Desserts
    Food(
        name: "Brownie",
        description: "Rich and fudgy chocolate brownie",
        price: 2.99,
        imagePath: "assets/images/desserts/brownie.jpg",
        availableAddons: [
          Addon(name: "Vanilla Ice Cream", price: 1.00),
          Addon(name: "Chocolate Sauce", price: 0.50)
        ],
        category: FoodCategory.desserts),
    Food(
        name: "Cheesecake Strawberry",
        description: "Classic cheesecake topped with fresh strawberry jam",
        price: 4.99,
        imagePath: "assets/images/desserts/cheescake.jpg",
        availableAddons: [Addon(name: "Whipped Cream", price: 0.50)],
        category: FoodCategory.desserts),
    Food(
        name: "Special Pancakes",
        description: "5 Pancakes with fresh strawberries and caramel sauce.",
        price: 7.99,
        imagePath: "assets/images/desserts/pancakes.jpg",
        availableAddons: [
          Addon(name: "Extra Pancake", price: 0.75),
          Addon(name: "Whipped Cream", price: 0.50)
        ],
        category: FoodCategory.desserts),
    Food(
        name: "Chocolate Cake",
        description: "Delicious chocolate cake with rich frosting",
        price: 3.99,
        imagePath: "assets/images/desserts/choc_cake.jpg",
        availableAddons: [Addon(name: "Extra Frosting", price: 0.75)],
        category: FoodCategory.desserts),
    Food(
        name: "Strawberry Bread",
        description: "Soft bread with fresh strawberries",
        price: 3.49,
        imagePath: "assets/images/desserts/straw_bread.jpg",
        availableAddons: [Addon(name: "Butter", price: 0.50)],
        category: FoodCategory.desserts),
    Food(
        name: "Fruit Punch",
        description: "Fresh Fruits with a punch of flavor",
        price: 4.49,
        imagePath: "assets/images/desserts/fruit_punch.jpg",
        availableAddons: [Addon(name: "Butter", price: 0.50)],
        category: FoodCategory.desserts),

    // Sides
    Food(
        name: "Fried Chicken",
        description: "Crispy fried chicken with special seasoning",
        price: 4.99,
        imagePath: "assets/images/sides/fried_chicken.jpg",
        availableAddons: [Addon(name: "Spicy Dip", price: 0.50)],
        category: FoodCategory.sides),
    Food(
        name: "Garlic Bread with Pasta",
        description: "Toasted garlic bread with creamy pasta",
        price: 9.49,
        imagePath: "assets/images/sides/garlic_bread_pasta.jpg",
        availableAddons: [Addon(name: "Extra Shrimp", price: 1.00)],
        category: FoodCategory.sides),
    Food(
        name: "Fries",
        description: "Freshly fried potato fries with special seasoning",
        price: 3.99,
        imagePath: "assets/images/sides/fries.jpg",
        availableAddons: [Addon(name: "Spicy Dip", price: 0.50)],
        category: FoodCategory.sides),
    Food(
        name: "Chicken with Veggies",
        description: "Grilled chicken with fresh vegetables",
        price: 4.99,
        imagePath: "assets/images/sides/chicken_veggies.jpg",
        availableAddons: [Addon(name: "Spicy Dip", price: 0.50)],
        category: FoodCategory.sides),
    Food(
        name: "Taco",
        description: "Delicious taco with fresh fillings",
        price: 3.99,
        imagePath: "assets/images/sides/tacos.jpg",
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.75),
          Addon(name: "Spicy Dip", price: 0.50)
        ],
        category: FoodCategory.sides),
    Food(
        name: "Dumplings with Soybeans",
        description: "Steamed dumplings served with soybeans",
        price: 4.99,
        imagePath: "assets/images/sides/dumplings_soybeans.jpg",
        availableAddons: [Addon(name: "Spicy Sauce", price: 0.50)],
        category: FoodCategory.sides),

    // Salads
    Food(
        name: "Russian Salad",
        description: "Creamy salad with vegetables and potatoes",
        price: 4.49,
        imagePath: "assets/images/salads/Russian_salad.jpg",
        availableAddons: [Addon(name: "Extra Mayo", price: 0.50)],
        category: FoodCategory.salads),
    Food(
        name: "Fresh Vegetable Salad",
        description: "Fresh salad with mixed vegetables",
        price: 3.99,
        imagePath: "assets/images/salads/veg_salad.jpg",
        availableAddons: [Addon(name: "Extra Dressing", price: 0.50)],
        category: FoodCategory.salads),
    Food(
        name: "White Pasta",
        description: "Creamy white sauce pasta",
        price: 5.49,
        imagePath: "assets/images/salads/white_pasta.jpg",
        availableAddons: [Addon(name: "Extra Cheese", price: 0.75)],
        category: FoodCategory.salads),
    Food(
        name: "Hot Pasta",
        description: "Spicy pasta with rich tomato sauce",
        price: 4.99,
        imagePath: "assets/images/salads/hot_pasta.jpg",
        availableAddons: [Addon(name: "Extra Chilli Flakes", price: 0.50)],
        category: FoodCategory.salads),
    Food(
        name: "Pasta with Shrimp",
        description: "Delicious pasta with fresh shrimp",
        price: 6.49,
        imagePath: "assets/images/salads/pasta with shrimps.jpg",
        availableAddons: [Addon(name: "Parmesan Cheese", price: 0.75)],
        category: FoodCategory.salads),
    Food(
        name: "Spaghetti",
        description: "Classic spaghetti with marinara sauce",
        price: 5.99,
        imagePath: "assets/images/salads/spaghetti.jpg",
        availableAddons: [Addon(name: "Meatballs", price: 1.50)],
        category: FoodCategory.salads),

    // Drinks

    Food(
        name: "Lime",
        description: "Refreshing lime drink",
        price: 2.49,
        imagePath: "assets/images/drinks/lime.jpg",
        availableAddons: [
          Addon(name: "Mint", price: 0.30),
          Addon(name: "Ice Cubes", price: 0.20)
        ],
        category: FoodCategory.drinks),
    Food(
        name: "Orange",
        description: "Freshly squeezed orange juice",
        price: 2.99,
        imagePath: "assets/images/drinks/orange.jpg",
        availableAddons: [Addon(name: "Ice Cubes", price: 0.20)],
        category: FoodCategory.drinks),
    Food(
        name: "Strawberry Shake",
        description: "Creamy strawberry shake with fresh strawberries",
        price: 3.99,
        imagePath: "assets/images/drinks/straw_shake.jpg",
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.50),
          Addon(name: "Extra Strawberries", price: 0.75)
        ],
        category: FoodCategory.drinks),
    Food(
        name: "Orange Lime",
        description: "A citrusy blend of orange and lime",
        price: 3.29,
        imagePath: "assets/images/drinks/orange_lime.jpg",
        availableAddons: [
          Addon(name: "Honey", price: 0.40),
          Addon(name: "Extra Lime", price: 0.30)
        ],
        category: FoodCategory.drinks),
    Food(
        name: "Mojito",
        description: "Refreshing mojito with mint and lime",
        price: 3.79,
        imagePath: "assets/images/drinks/mojito.jpg",
        availableAddons: [
          Addon(name: "Extra Mint", price: 0.50),
          Addon(name: "Sugar Syrup", price: 0.40)
        ],
        category: FoodCategory.drinks),
    Food(
        name: "Cappuccino",
        description: "Classic cappuccino with frothy milk",
        price: 2.49,
        imagePath: "assets/images/drinks/coffee.jpg",
        availableAddons: [Addon(name: "Whipped Cream", price: 0.30)],
        category: FoodCategory.drinks),
  ];

  //getters
  List<Food> get menu => _menu;
  List<Food> getBurgers() {
    return _menu
        .where((element) => element.category == FoodCategory.burgers)
        .toList();
  }

  List<Food> getSalads() {
    return _menu
        .where((element) => element.category == FoodCategory.salads)
        .toList();
  }

  List<Food> getSides() {
    return _menu
        .where((element) => element.category == FoodCategory.sides)
        .toList();
  }

  List<Food> getDrinks() {
    return _menu
        .where((element) => element.category == FoodCategory.drinks)
        .toList();
  }

  List<Food> getDesserts() {
    return _menu
        .where((element) => element.category == FoodCategory.desserts)
        .toList();
  }
  //Operations
  //add to cart
  //remove from cart
  //clear cart
  //get total price
  //get total number of items in cart

// helper functions

//generate receipts

//format double value to money

//format list of addons into string
}
