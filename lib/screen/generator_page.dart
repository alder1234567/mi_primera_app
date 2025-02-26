import 'package:flutter/material.dart'; 
import 'package:mi_primera_app/widgets/history_list_view.dart';
import 'package:provider/provider.dart';

import '../providers/my_app_state.dart';
import '../widgets/big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
 
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: HistoryListView(),
            ),
            SizedBox(height: 10),
            BigCard(pair: pair),
            SizedBox(height: 10),
        
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite(pair);
                  },
                  icon: Icon(icon), 
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  }, 
                  child: Text('Next'),
                ),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
    );
  }
} 