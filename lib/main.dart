import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:rclient/pages/home.dart';
import 'package:rclient/pages/searchpage.dart';
import 'package:rclient/notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => StaticNotifier(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
        return MaterialApp(
          title: 'RClient',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          home: const MyWidget(),
        );
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0;
  int _minimumTabWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RClient'),
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width <=
                context.watch<StaticNotifier>().minimumWidth
            ? NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                backgroundColor: Theme.of(context).colorScheme.surface,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.thumb_up),
                    label: 'Liked',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              )
            : null,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width >
                context.watch<StaticNotifier>().minimumWidth)
              NavigationRail(
                backgroundColor: Theme.of(context).colorScheme.surface,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                    padding: EdgeInsets.all(8),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.thumb_up),
                    label: Text('Liked'),
                    padding: EdgeInsets.all(8),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                    padding: EdgeInsets.all(8),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                    padding: EdgeInsets.all(8),
                  ),
                ],
              ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  HomePage(),
                  SearchPage(),
                ],
              ),
            ),
            // naviagation rail
          ],
        ));
  }
}
