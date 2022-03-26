import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login or Register',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          TabBar(
            labelColor: Colors.black,
            onTap: (int index){
              setState(() {
                _tabController.index = index;
              });
            },
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            controller: _tabController,
              tabs: const [
                Tab(text: 'first',),
                Tab(text: 'Secend',)
              ],
          ),

                IndexedStack(
                  index: _tabController.index,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context,index){
                      return const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Title'),
                      );
                    }
                    ),
                    const Text('Text'),
                  ],
                ),
        ],
      ),
    );
  }
}
