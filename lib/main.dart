import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/livre_provider.dart';
import 'package:flutter_app/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  //root widget
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Livre_Provider()), // Fournissez votre provider ici
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
