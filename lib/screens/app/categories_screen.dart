
import 'package:flutter/material.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}
class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        itemBuilder: (context,index){
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.category),
            title: Text('Category #$index'),
            subtitle: const Text('Category Details'),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        }
        , separatorBuilder: (context,index){
      return const Divider(
        color: Colors.black26,
        thickness: 0.8,
        indent: 30,
        endIndent: 30,
      );
    },
        itemCount: 10);
  }
}
