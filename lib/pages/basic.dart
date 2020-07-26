import 'package:flutter/material.dart';

import 'package:disenos/pages/scroll.dart';
import 'package:disenos/pages/buttons.dart';

class Basic extends StatelessWidget {
  static const routeName = 'basic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            _buildHeader(),
            _buildActions(context),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'images/gray-bridge-and-trees.jpg',
        height: 254,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lago con un puente', style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text(
                  'Descripción del lago',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.amber, size: 36),
          Text('41', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        _buildAction(Icons.phone, 'Call',
            () => Navigator.pushNamed(context, Scroll.routeName)),
        _buildAction(Icons.near_me, 'Route',
            () => Navigator.pushNamed(context, Buttons.routeName)),
        _buildAction(Icons.share, 'Share'),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget _buildAction(IconData icon, String label, [Function onPressed]) {
    return FlatButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.blue),
          Text(
            label.toUpperCase(),
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          'Laboris aute id eu labore aute pariatur est dolor non. Laborum ea laboris in veniam Lorem sint ea ut sit dolore cillum esse cillum enim. Incididunt excepteur eiusmod sint et amet ex consectetur consectetur sint incididunt cillum nulla.\n\n'
          'Quis commodo excepteur proident duis quis exercitation non pariatur quis adipisicing incididunt dolore commodo ullamco.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
