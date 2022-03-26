import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(

          child: Stack(
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
                      color: const Color(0xFF30536F),
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
        ),
        const Text('Similar',
          style: TextStyle(
            color: Color(0xFF606060),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(

          height: 1000,
          child: GridView(
            padding: const EdgeInsets.only(bottom: 0.1),
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  mainAxisSpacing: 0.8,
                  crossAxisSpacing: 0.8,
                ),
            children: [
              Image.asset('images/5th img.png',
              ),
              Image.asset('images/ue.png'),
              Image.asset('images/fd.png'),
            ],
          ),
        ),
      ],
    );
  }
}
