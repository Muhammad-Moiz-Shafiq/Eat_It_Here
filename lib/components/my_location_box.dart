import 'package:flutter/material.dart';

class MyCurrentLocationBox extends StatefulWidget {
  const MyCurrentLocationBox({super.key});

  @override
  State<MyCurrentLocationBox> createState() => _MyCurrentLocationBoxState();
}

class _MyCurrentLocationBoxState extends State<MyCurrentLocationBox> {
  String location = 'Rahmat Hostel, Bolan Rd';
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Location'),
        content: TextField(
          onChanged: (value) {
            //update location
            setState(() {
              location = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter your location',
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Save',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Now',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                  location,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
