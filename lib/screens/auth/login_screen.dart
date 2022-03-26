import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TapGestureRecognizer _tapGestureRecognizer;

  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap=_navigateToRegister;

  }
  void _navigateToRegister()=> Navigator.pushNamed(context, '/register_screen');
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'images/bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
       padding:  const EdgeInsets.only(left: 60,right: 40,top: 190,bottom: 120),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           const Text('Welcome Back',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Text('Enter Email & password',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            onTap: ()=> print('focused'),
            //enabled: true,
            onChanged: (String value)=>print('Value: $value'),
            textDirection: TextDirection.ltr,
            expands:true,
            minLines: null,
            maxLines: null,
            decoration:  InputDecoration(
              errorText: _emailErrorText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(maxHeight: 60,minHeight: 50),
             hintText: 'Email',
              hintMaxLines: 1,
              hintStyle: const TextStyle(color: Colors.black38),
              enabled: true,
              prefixIcon: const Icon(Icons.email),
              filled: true,
              fillColor: Colors.grey.shade200,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade100,
                    width: 1,
                  )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade200,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade900,
                  width: 1,
                ),
              ),
                ),
            //maxLength: 35,
            buildCounter: (context,{required int currentLength,int? maxLength,required bool isFocused}){
              return Text('[$currentLength - $maxLength]',
                style: const TextStyle(
                  color: Colors.black38,
                ),
              );
            },
              ),
          const SizedBox(height: 10,),
          TextField(
            controller: _passwordTextController,
            obscureText: true,
            expands: false,
            minLines: 1,
            maxLines: 1,
            maxLength:15,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              errorText: _passwordErrorText,
              errorMaxLines: 1,
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: 'Password',
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Icon(Icons.lock),
              constraints: const BoxConstraints(minHeight: 70, maxHeight: 70),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade500,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade900,
                  width: 1,
                ),
              ),
            ),

          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: ()=>_performelogin(), child: const Text('LOGIN'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity , 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: RichText(
              text: TextSpan(text: 'Don\'t have an acount',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
                children: [
                  TextSpan(
                    recognizer: _tapGestureRecognizer,
                    text: '  Create Now!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]
            ),
            ),
          ),
      ],
            ),
          )

          ],
        ),
      ),
    );
  }
  void _performelogin(){
    if(_checkData()){
      _login();
    }
  }
  bool _checkData(){
    if(_emailTextController.text.isNotEmpty&& _passwordTextController.text.isNotEmpty){
      controlErrorText();
      return true;
    }else{
      controlErrorText();
    }
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Required Data'),
    //  backgroundColor: Colors.red,
    //  behavior: SnackBarBehavior.floating,

   // ),
 //   );
    return false;
  }
  void controlErrorText(){
    setState(() {
      _emailErrorText = _emailTextController.text.isEmpty?'Enter Email' : null;
      _passwordErrorText =_passwordTextController.text.isEmpty?'Enter password': null;
    }
    );
  }
  void _login(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged in Succssesfoly'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
    ).closed.then((value) => Navigator.pushReplacementNamed(context, '/main_screen'));
  }
}
//Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Welcome Back',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             const Text('Enter Email & password',
//               style: TextStyle(
//                 color: Colors.black45,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 15,),
//             TextField(
//               controller: _emailTextController,
//               keyboardType: TextInputType.emailAddress,
//               onTap: ()=> print('focused'),
//               cursorColor: Colors.orange,
//               cursorHeight: 10,
//               cursorRadius: const Radius.circular(10),
//               cursorWidth: 5,
//               enabled: true,
//               //onChanged: (String value){
//                // print('Value: $value');
//               //},
//               //obscureText: true,
//               //obscuringCharacter: '#',
//               textDirection: TextDirection.ltr,
//               decoration:  InputDecoration(
//                 errorText: _emailErrorText,
//                 constraints: const BoxConstraints(
//                   maxHeight: 80,
//                   minHeight: 80,
//                 ),
//                labelText: 'Email',
//                 floatingLabelBehavior: FloatingLabelBehavior.auto,
//                 floatingLabelStyle: const TextStyle(
//                   letterSpacing: 3,
//                   color: Colors.black38,
//                 ),
//                 helperText: 'example@visionplus.ps',
//                 helperStyle: const TextStyle(
//                   color: Colors.black,
//                 ),
//                 prefixIcon: const Icon(Icons.email),
//                 //prefixText: 'vp-',
//                // prefix: Icon(Icons.send),
//                 suffixIcon: const Icon(Icons.check_circle),
//                 //suffix: Icon(Icons.send),
//                 filled: true,
//                 fillColor: Colors.grey.shade200,
//                 //enabledBorder: InputBorder.none,
//                 //enabledBorder: UnderlineInputBorder(
//                  // borderSide:BorderSide(
//                     //color: Colors.orange,
//                    // width: 1
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     color: Colors.pink,
//                     width: 5,
//                   ),
//
//
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//                   ),
//               //maxLength: 35,
//               buildCounter: (context,{required int currentLength,int? maxLength,required bool isFocused}){
//                 return Text('[$currentLength - $maxLength]',
//                   style: const TextStyle(
//                     color: Colors.black38,
//                   ),
//                 );
//               },
//               style: const TextStyle(
//                 color: Colors.black38,
//               ),
//               textCapitalization: TextCapitalization.words,
//               maxLines: null,
//               minLines: null,
//               expands: true,
//                 ),
//             const SizedBox(height: 20,),
//             TextField(
//               controller: _passwordTextController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 errorText: _passwordErrorText,
//                 counterText: '',
//                 filled:true,
//                 fillColor: Colors.grey.shade300,
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                     width: 2,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 prefixIcon: const Icon(Icons.lock),
//                // prefixText: 'phone',
//                 prefix: const Icon(Icons.phone_android),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     color: Colors.blue,
//                     width:1,
//                   ),
//                 ),
//                 hintText: 'Mobile',
//                 helperText: 'mobile',
//               ),
//               maxLength: 15,
//             ),
//             const SizedBox(height: 10,),
//             ElevatedButton(onPressed: ()=>_performelogin(), child: const Text('LOGIN'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity , 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 )
//               ),
//             ),
//             const SizedBox(height: 20,),
//             Center(
//               child: RichText(
//                 text: TextSpan(text: 'Don\'t have an acount',
//                 style: const TextStyle(
//                   color: Colors.black45,
//                 ),
//                   children: [
//                     TextSpan(
//                       recognizer: _tapGestureRecognizer,
//                       text: '  Create Now!',
//                       style: TextStyle(
//                         color: Colors.blue.shade900,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//
//                       )
//                     ),
//                   ]
//               ),
//               ),
//             ),
//         ],
//               ),
//             )