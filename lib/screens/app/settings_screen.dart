import 'package:flutter/material.dart';
import 'package:vp12_ui_application/models/address.dart';
import 'package:vp12_ui_application/models/city.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notofication = false;
  String _gender = 'M';
  String? _selectedCityId;
  late TextEditingController _experienceTextController;
   List <Address> _addresses = <Address>[
    Address(title:'Gaza'),
    Address(title: 'Rafah'),
    Address(title: 'Alnosyrat'),
    Address(title: 'Jabalya'),
  ];
   List <City> _cities = <City>[
    City(name: 'City1', id: 1),
    City(name: 'City2', id: 2),
    City(name: 'City3', id: 3),
    City(name: 'City4', id: 4),
  ];
   List <String> _experiences = <String> [];
  @override
  void initState() {
    super.initState();
    _experienceTextController = TextEditingController();
  }
  @override
  void dispose() {
    _experienceTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Notofication'),
            subtitle: const Text('Enabled/disabled'),
            value: _notofication,
            onChanged: (bool value){
            print('Value $value');
            setState(() {
              _notofication = value;
            });
            }
        ),
        const SizedBox(height: 20,),
        const Text('Gender',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        RadioListTile<String>(
          contentPadding: EdgeInsets.zero,
          title: const Text('Male'),
            value: 'M',
            groupValue: _gender,
            onChanged: (String? value){
            if(value!= null){
              setState(() {
                _gender = value;
              });
            }
            },
        ),
        RadioListTile<String>(
          contentPadding: EdgeInsets.zero,
          title: const Text('Female'),
          value: 'F',
          groupValue: _gender,
          onChanged: (String? value){
            if(value != null){
              setState(() {
                _gender = value;
              });

            }
          },
        ),
        const SizedBox(height: 20,),
        const Text(
          'Addresses',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        for(Address address in _addresses)
          CheckboxListTile(
              title: Text(address.title),
              value:address.selected,
              onChanged: (bool? value){
                if(value!= null){
                  setState(() {
                    address.selected = value;
                   });
                }
              }
          ),
        const SizedBox(height: 20,),
        const Text(
          'City',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownButton<String>(
          isExpanded: true,
            value: _selectedCityId,
            hint: Text('Select Id'),
            items: _cities.map(
                    (City city) => DropdownMenuItem<String>(child:Text(city.name),
                      value: city.id.toString(),
                    )
            )
                .toList(),
            onChanged: (String? value){
            if(value!= null){
              setState(() {
                _selectedCityId = value;
              });
            }
            }
        ),
        const SizedBox(height: 20,),
        const Text(
          'Experiencies',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10,),
        TextField(
          maxLength: 20,
          controller: _experienceTextController,
          decoration: InputDecoration(
            hintText: 'Experience',
            counterText: '',
            suffixIcon:IconButton(onPressed: ()=> performeSave(),
              icon: const Icon(Icons.save),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Wrap(
          runAlignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children:_experiences.map((experience)  {
            return Chip(
              deleteIcon: Icon(Icons.close),
              deleteIconColor: Colors.red,
              onDeleted: (){
                setState(() {
                  _experiences.removeWhere((element) => element == experience);
                });
              },
              label: Text(experience),
              elevation: 2,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(
                  width: 0.8,
                  color: Colors.blue,
                ),


              ),
            );
          }) .toList(),
        ),
        
      ],
    );
  }
  void performeSave() {
    if (checkData()) {
      save();
    }
  }
  bool checkData(){
    if(_experienceTextController.text.isNotEmpty){
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Enter Experiene Name!'),
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }
  void save(){
    setState(() {
      _experiences.add(_experienceTextController.text);
    });
    clear();
  }
  void clear(){
    _experienceTextController.text='';
  }
}
