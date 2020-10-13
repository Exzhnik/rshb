import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rshb/domain/change_favorites.dart';
import 'package:rshb/domain/food_repository.dart';
import 'package:rshb/model/favorites_id.dart';
import 'package:rshb/resource/theme/theme_notifier.dart';
import 'package:rshb/domain/bloc/food_bloc.dart';
import 'package:rshb/screens/catalogs.dart';
import 'resource/theme/theme_values.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(FavoritesIdAdapter());
  await Hive.openBox<int>('favorites');

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
