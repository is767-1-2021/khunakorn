import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  get decoration => null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            color: Colors.amber,
            height: 80,
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, '/1');},
              title: Text("1. Location"),
              trailing: IconButton(
                icon: Icon(
                  Icons.map,
                  color: Colors.blueAccent,
                  ),
                color: Colors.amber[600],
                onPressed: () {},
              ),
            ),
          ),
          Container(
            color: Color(0xFFEFDFBB),
            height: 80,
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, '/2');},
              title: Text("2. Favorit"),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                  ),
                color: Colors.amber[600],
                onPressed: () {},
              ),
            ),
          ),
          Container(
            color: Colors.amber,
            height: 80,
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, '/3');},
              title: Text("3. Deal Sharing"),
              trailing: IconButton(
                icon: Icon(
                  Icons.attach_money,
                  color: Colors.blueAccent,
                  ),
                color: Colors.amber[600],
                onPressed: () {},
              ),
            ),
          ),
          Container(
            color: Color(0xFFEFDFBB),
            height: 80,
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, '/4');},
              title: Text("4. Fourth Page"),
              trailing: IconButton(
                icon: Icon(
                  Icons.audiotrack,
                  color: Colors.blueAccent,
                  ),
                color: Colors.amber[600],
                onPressed: () {},
              ),
            ),
          ),
          Container(
            color: Colors.amber,
            height: 80,
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, '/5');},
              title: Text("5. Fifth Page"),
              trailing: IconButton(
                icon: Icon(
                  Icons.money,
                  color: Colors.blueAccent,
                  ),
                color: Colors.amber[600],
                onPressed: () {},
              ),
            ),
          ),
          Container(
            
            color: Color(0xFFEFDFBB),
            height: 80,
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, '/6');},
              title: Text("6. Sixth Page"),
              trailing: IconButton(
                icon: Icon(
                  Icons.cloud_done,
                  color: Colors.blueAccent,
                  ),
                color: Colors.amber[600],
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

