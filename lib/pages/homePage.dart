import 'package:eat_it_here/components/my_tabbar.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
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
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  //Current Location Box
                  MyCurrentLocationBox(),
                  //Description Box
                  MyDescriptionBox(),
                ]),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('1st Item $index'),
                  );
                }),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('2nd Item $index'),
                  );
                }),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('3rd Item $index'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
