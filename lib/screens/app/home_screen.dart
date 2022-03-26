import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
            children: [
          Image.asset('images/img.png',
        width: double.infinity),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 400,right: 0,left: 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 20),
                    width: double.infinity,
                    height: 80,
                    color:const Color(0xFF30536F),
                    child: const Text('Coats',

                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),

                    ),
                  ),
                ),
              )
              ,]
        ),

        SizedBox(
          child: Image.asset('images/imgg.png'),
          width: double.infinity,
        ),

      ],
    );

  }
}
