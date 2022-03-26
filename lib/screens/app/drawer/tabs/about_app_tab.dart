import 'package:flutter/material.dart';

class AboutAppTab extends StatefulWidget {
  const AboutAppTab({Key? key}) : super(key: key);

  @override
  _AboutAppTabState createState() => _AboutAppTabState();
}

class _AboutAppTabState extends State<AboutAppTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(radius: 50,
          backgroundColor: Colors.blue,
        ),
        SizedBox(height: 20),
        Text('Ui App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        )
      ],
    );
  }
}
