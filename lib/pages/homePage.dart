import 'package:eat_it_here/components/my_tabbar.dart';
import 'package:eat_it_here/models/food.dart';
import 'package:eat_it_here/models/restaurant.dart';
import 'package:eat_it_here/pages/food_page.dart';
import 'package:eat_it_here/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../components/food_tile.dart';
import '../components/mySliverAppBar.dart';
import '../components/my_description_box.dart';
import '../components/my_drawer.dart';
import '../components/my_location_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String username;
  @override
  void initState() {
    super.initState();
    username = AuthService().getUserDisplayName();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //sort out and filter categories of food
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //getting foods in a category
  List<Widget> getFoodsInCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoricalMenu = _filterMenuByCategory(category, fullMenu);

      //returning list
      return ListView.builder(
        itemCount: categoricalMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => FoodTile(
          food: categoricalMenu[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                  food: categoricalMenu[index],
                ),
              ),
            );
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool exitApp = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Exit App?"),
              content: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    AuthService().signOut();
                    SystemNavigator.pop(); // Exit the app
                  },
                  child: Text(
                    "Exit",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );

          if (exitApp == true) {
            SystemNavigator.pop(); // Exit the app
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        drawer: MyDrawer(username: username),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    //Current Location Box
                    MyCurrentLocationBox(),
                    //Description Box
                    const MyDescriptionBox(),
                  ]),
            )
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodsInCategory(restaurant.menu),
            ),
          ),
        ),
      ),
    );
  }
}
