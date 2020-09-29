import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rshb/config/theme/theme_notifier.dart';
import 'package:rshb/domain/bloc/food_bloc.dart';
import 'package:rshb/screens/catalog.dart';
import 'config/theme/theme_values.dart';
import 'domain/change_favorites.dart';
import 'domain/food_repository.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(greenTheme)),
    ChangeNotifierProvider<ChangeFavorites>(
      create: (_) => ChangeFavorites(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Каталог',
      home: BlocProvider(
        create: (context) => FoodBloc(repository: FoodRepository()),
        child: Catalog(),
      ),
    );
  }
}
