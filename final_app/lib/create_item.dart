
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pocket_page.dart';

class CreateItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Items'),
        leading: IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => ItemPage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back),
        ),
      ),

      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          child: NewItem()),
    );
  }
}

class NewItem extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _itemdetail = GlobalKey<FormState>();
  String? _description;
  DateTime? _createdDateTime;
  int? _amount;
  String? _category;


  final items = [
    'Revenue',
    'Expense',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _itemdetail,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'type your item'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type Description';
              }

              return null;
            },
            onSaved: (value) {
              _description = value;
            },
          ),

          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Amount',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'How many?'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter amount';
              }
            },
            onSaved: (value) {
              _amount = int.parse(value!);
            },
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
              value: _category,
              isExpanded: true,
              items: items
                  .map((label) => DropdownMenuItem(
                        child: Text(
                          label,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        value: label,
                      ))
                  .toList(),
              hint: Text('Choose category'),
              onChanged: (value) {
                setState(() {
                  _category = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please choose item catergory.';
                }

                return null;
              },
              onSaved: (value) {
                _category = value;
              },
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 55,
            width: 300,
            child: ElevatedButton(
              onPressed: () async {
    

                if (_itemdetail.currentState!.validate()) {
                  _itemdetail.currentState!.save();

                  await FirebaseFirestore.instance
                      .collection('final_app')
                      .add({
                    'createdDateTime': _createdDateTime,
                    'description': _description,
                    'category': _category,
                    'amount': _amount,
                  });
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ItemPage()));
                }
              },
              child: Text(
                'Create',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
