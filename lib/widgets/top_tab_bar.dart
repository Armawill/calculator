import 'package:flutter/material.dart';

class TopTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.calculate_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.backup_table_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.attach_money),
          ),
        ],
      ),
    );
  }
}
