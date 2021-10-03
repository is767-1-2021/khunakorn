import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/model/form.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deal Sharing'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _dealName;
  String? _productName;
  int? _price;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your deal name',
              icon: Icon(Icons.contact_mail),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter deal name.';
              }

              return null;
            },
            onSaved: (value) {
              _dealName = value;
            },
            initialValue: context.read<FormModel>().dealName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your product name',
              icon: Icon(Icons.production_quantity_limits),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter product name.';
              }

              return null;
            },
            onSaved: (value) {
              _productName = value;
            },
            initialValue: context.read<FormModel>().productName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter price',
              icon: Icon(Icons.attach_money),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                  return 'Please enter price.';
              }

              if (int.parse(value) < 0){
                return 'Please enter valid price';
              }

              return null;
            },
            onSaved: (value) {
              _price = int.parse(value!);
            },
            initialValue: context.read<FormModel>().price.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FormModel>().dealName = _dealName;
                context.read<FormModel>().productName = _productName;
                context.read<FormModel>().price = _price;

                Navigator.pop(context);
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}