import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Inite State');
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/ore.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(

              color: Colors.white38,
             width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 180,),
                  Image.asset('images/Oriina.png',
                    alignment: AlignmentDirectional.topStart,
                  ),
                  const SizedBox(height: 10,),
                 const Text('Paris',
                   style: TextStyle(
                     color: Color(0xFF324452),
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                   ),

                 ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
