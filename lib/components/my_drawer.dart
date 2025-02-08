import 'package:eat_it_here/components/drawer_tile.dart';
import 'package:flutter/material.dart';

import '../pages/all_order_page.dart';
import '../pages/settings.dart';
import '../services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Icon(
                Icons.fastfood,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            MyDrawerTile(
              title: 'H O M E',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            MyDrawerTile(
              title: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            MyDrawerTile(
              title: 'M Y  O R D E R S',
              icon: Icons.fastfood_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrders()));
              },
            ),
            const Spacer(),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: MyDrawerTile(
                title: 'L O G O U T',
                icon: Icons.logout,
                onTap: () {
                  logout();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
