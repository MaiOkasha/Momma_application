import 'package:flutter/material.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset('images/img.png',),
          const SizedBox(height: 20,),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),

          ),
          const SizedBox(height: 20,),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize:17,
              color: Color(0xFF716F87),
            ),
          ),
        ],
      ),
    );
  }
}

