import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rshb/config/theme/theme_notifier.dart';
import 'package:rshb/domain/change_favorit.dart';
import 'package:rshb/screens/catalog.dart';
import 'config/theme/theme_values.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(greenTheme)),
    ChangeNotifierProvider<ChangeFavorite>(
      create: (_) => ChangeFavorite(),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Каталог',
      home: Catalog(),
      theme: themeNotifier.getTheme(),
    );
  }
}
