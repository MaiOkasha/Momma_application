import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vp12_ui_application/models/bn_item.dart';
import 'package:vp12_ui_application/screens/app/categories_screen.dart';
import 'package:vp12_ui_application/screens/app/home_screen.dart';
import 'package:vp12_ui_application/screens/app/products.dart';
import 'package:vp12_ui_application/screens/app/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndix = 0;
  final List<BnItem> _bnItems = <BnItem>[
    const BnItem(title: 'Home', widget:  HomeScreen()),
    const BnItem(title: 'Categories', widget: CategoriesScreen()),
    const BnItem(title: 'Products', widget: ProductsScreen()),
    const BnItem(title: 'Settings', widget: SettingsScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_bnItems[_currentIndix].title),
        actions: [
          Visibility(
            visible: _currentIndix==3,
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: _bnItems[_currentIndix].widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndix = index;
          });
        } ,
        currentIndex: _currentIndix,
        backgroundColor: Colors.white,
        //fixedColor: Colors.orange,
        selectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(
          color: Colors.pink
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
                accountName: Text('Flutter'),
                accountEmail: Text('Flutter@gmail.com'),
              currentAccountPicture: CircleAvatar(),
             // currentAccountPictureSize: Size(80,80),
              otherAccountsPictures: [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
              ],
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQs'),
              subtitle: const Text('Most Asked Questions'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
              onTap: (){
                Navigator.pushNamed(context, '/faqs_screen');
                Future.delayed(const Duration(microseconds: 500));
              },
            ),
             ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About App'),
              subtitle: const Text('Who we are?'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
              onTap: (){
                Navigator.pushNamed(context, '/about_app_screen');
                Future.delayed(const Duration(microseconds: 500));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('TestTab'),
              subtitle: const Text('------'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
              onTap: (){
                Navigator.pushNamed(context, '/test_screen');
                Future.delayed(const Duration(microseconds: 500));
              },
            ),
            const Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
             ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Return to login'),
              onTap:() {
                  _showLogoutConformationDialog();
                }
                ),
          ],
        ),
      ),
    );
  }
  void _showLogoutConformationDialog(){
    showDialog(
      barrierDismissible: false,
        context: context, builder: (context){
        if(Platform.isAndroid) {
          return AlertDialog(
            title: const Text('Log Out'),
            content: const Text('Are you sure'),
            actions: [
              TextButton(onPressed: () {}, child: const Text('Yes')),
              TextButton(onPressed: () {}, child: const Text('No'))
            ],
          );
        }else {
          return CupertinoAlertDialog(
            title: const Text('Log out'),
            content: const Text('Are you sure?'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('No')),
            ],
          );
        }
    }
    );
  }
}
