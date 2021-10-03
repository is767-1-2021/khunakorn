import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/model/form.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget{
  @override
  _SecondPageState createState() => _SecondPageState();
  }
  
class _SecondPageState extends State<SecondPage>{
  String? _formData = 'Please click to fill your deal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ),
              );
            },
            icon: Icon(Icons.favorite)
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle)),
        ]
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FormModel>(
                builder: (context, form, child) {
                  return Text('${form.dealName} ${form.price}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              child: Text('Fill this your deal please'),
            ),
          ],
        ),
      ),
    );
  }
}
