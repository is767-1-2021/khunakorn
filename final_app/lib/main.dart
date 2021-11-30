import 'package:final_app/controllers/item_controller.dart';
import 'package:final_app/model/item_model2.dart';
import 'package:final_app/pocket_page.dart';
import 'package:final_app/services/item_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = ItemController(services);

  runApp(PocketApp(
    controller: controller,
  ));
}

class PocketApp extends StatelessWidget {
  final ItemController controller;
  PocketApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemModel()),
        Provider(create: (context) => ItemDB()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.deepPurple,
              fontFamily: 'IBM Plex Sans Thai'),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapShot) {
                return ItemPage();
              }),
          initialRoute: 'home',
          routes: <String, WidgetBuilder> {
          'home': (context) => ItemPage(),
          }),
    );
  }
}

