import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'location_page.dart';


class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Favorite',
        style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade600,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => LocationPage(),
                ),
              );
            },
            icon: Icon(Icons.map)
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle)),
        ]
      ),
        
        body: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(
                    'KAMU BUY 1 GET 1',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรชานมไข่มุก KAMU 1 แถม 1 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 28 September 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/kamu.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_rounded)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'KRISPYKREME BUY 1 GET 1',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรโดนัท Krispy-Kreme 1 แถม 1 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 12 September 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/krispykreme.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_rounded)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('OISHI มา 4 จ่าย 3',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรบุฟเฟ่ต์ OISHI มา 4 จ่าย 3 ครับ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  3',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 30 August 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/oishi.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_rounded)),
                ),
              ),
              Card(
                
              ),
            ],
          ),
        ));
  }
}