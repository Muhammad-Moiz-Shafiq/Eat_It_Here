import 'package:flutter/material.dart';

class MyCurrentLocationBox extends StatelessWidget {
  const MyCurrentLocationBox({super.key});
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your Location'),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your location',
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Save'),
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
                  'Rahmat Hostel, Bolan Rd',
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
