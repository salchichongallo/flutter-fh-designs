import 'package:flutter/material.dart';

import 'package:disenos/pages/buttons.dart';

class Scroll extends StatelessWidget {
  static const routeName = 'scroll';

  final controller = PageController();

  _handleNextSection() {
    controller.animateToPage(
      1,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 750),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          SectionOne(onNextTap: _handleNextSection),
          SectionTwo(),
        ],
      ),
    );
  }
}

class SectionOne extends StatelessWidget {
  SectionOne({@required this.onNextTap});

  final Function onNextTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundColor(),
        _backgroundImage(),
        _content(),
      ],
    );
  }

  Widget _backgroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(122, 236, 203, 1),
              Color.fromRGBO(108, 192, 218, 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset('images/scroll-1.png'),
    );
  }

  Widget _content() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 64),
          _shadowedText('11°'),
          _shadowedText('Miércoles'),
          Expanded(child: Container()),
          _nextSectionButton(),
        ],
      ),
    );
  }

  Text _shadowedText(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        shadows: [
          Shadow(
            blurRadius: 2,
            offset: Offset(1, 1),
            color: Colors.black38,
          ),
        ],
      ),
    );
  }

  Widget _nextSectionButton() {
    final shadowWorkaround = Positioned(
      left: 1,
      top: 2,
      child: Icon(
        Icons.keyboard_arrow_down,
        size: 70,
        color: Colors.black38,
      ),
    );

    return GestureDetector(
      onTap: onNextTap,
      child: Stack(
        children: [
          shadowWorkaround,
          Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white),
        ],
      ),
    );
  }
}

class SectionTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text('Bienvenido', style: TextStyle(fontSize: 20)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, Buttons.routeName);
          },
        ),
      ),
    );
  }
}
