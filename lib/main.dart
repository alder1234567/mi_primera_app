import 'package:flutter/material.dart'; 
import 'package:mi_primera_app/screen/my_home_page.dart';
import 'package:mi_primera_app/providers/my_app_state.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'My primera app',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
} 