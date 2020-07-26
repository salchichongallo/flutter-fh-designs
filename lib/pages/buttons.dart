import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:disenos/pages/basic.dart';
import 'package:disenos/pages/scroll.dart';

class Buttons extends StatelessWidget {
  static const routeName = 'buttons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          SingleChildScrollView(
            child: Column(
              children: [_header(), _content(context)],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _background() {
    final gradient = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff44214E),
            Color(0xff090A1B),
          ],
        ),
      ),
    );

    final box = Transform.rotate(
      angle: 90,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(56),
          gradient: LinearGradient(
            colors: [
              Color(0xffFF84B0),
              Color(0xffFF46C4),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: [
        gradient,
        Positioned(top: -64, child: box),
      ],
    );
  }

  Widget _header() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify Transaction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xffFF46C4),
        canvasColor: Color.fromRGBO(55, 57, 84, 1),
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1)),
            ),
      ),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, size: 28),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bubble_chart, size: 28),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle, size: 28),
          title: Container(),
        ),
      ]),
    );
  }

  Widget _content(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            ButtonTableItem(Colors.blue, Icons.border_all, 'General',
                () => Navigator.pushNamed(context, Basic.routeName)),
            ButtonTableItem(Colors.purpleAccent, Icons.directions_bus, 'Bus',
                () => Navigator.pushNamed(context, Scroll.routeName)),
          ],
        ),
        TableRow(
          children: [
            ButtonTableItem(Colors.pinkAccent, Icons.shop, 'Buy'),
            ButtonTableItem(Colors.orange, Icons.insert_drive_file, 'File'),
          ],
        ),
        TableRow(
          children: [
            ButtonTableItem(
                Colors.blueAccent, Icons.movie_filter, 'Entertainment'),
            ButtonTableItem(Colors.green, Icons.cloud, 'Grocery'),
          ],
        ),
        TableRow(
          children: [
            ButtonTableItem(Colors.red, Icons.collections, 'Photos'),
            ButtonTableItem(Colors.teal, Icons.help_outline, 'FAQ'),
          ],
        ),
      ],
    );
  }
}

class ButtonTableItem extends StatelessWidget {
  final Color iconBackground;
  final IconData icon;
  final String text;

  final Function onPressed;

  ButtonTableItem(this.iconBackground, this.icon, this.text, [this.onPressed]);

  _handleTap() {
    if (onPressed != null) {
      onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        height: 180,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: iconBackground,
              radius: 28,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: iconBackground,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
