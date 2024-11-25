import 'package:flutter/material.dart'; 
import 'package:mi_primera_app/screen/favorite_page.dart';
import 'package:mi_primera_app/screen/generator_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page =FavoritePage();
        default:
          throw UnimplementedError('No Widget for $selectedIndex');
    }
    return LayoutBuilder( builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >=600, 
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home), 
                        label: Text('Inicio'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favoritos')
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: constraints.maxWidth >=600
                        ? Text(
                            '© ${DateTime.now().year} bretmer',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        : Text(
                            '© Btm',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            )),
          ],
        ),
      );
    });
  }  
}