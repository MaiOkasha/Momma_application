import 'package:flutter/material.dart';
import 'package:vp12_ui_application/models/questions.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  List<Questions>_questions = <Questions>[
    Questions(questions:'Question #1',answer: 'Question #1 Answer', ),
    Questions(questions:'Question #2',answer: 'Question #2 Answer', ),
    Questions(questions:'Question #3',answer: 'Question #3 Answer', ),
    Questions(questions:'Question #4',answer: 'Question #4 Answer', ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          elevation: 0,
        backgroundColor: Colors.white,
        //iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon:const Icon(Icons.arrow_back_ios,
          color: Colors.black,
        ),
        ),
        title:  Text('FAQs',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children:[
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _questions[panelIndex].expanded = !isExpanded;
              });
            },
            children: _questions.map((questions)  {
              return ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: questions.expanded,
                  headerBuilder: (context,isExpanded){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        questions.questions,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    );
                  },
                  body: Text(questions.answer),
              );

            }).toList(),
          ),
        ]
    ),
    );
  }
}
