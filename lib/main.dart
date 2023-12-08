import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vehicle/first_page.dart';
import 'package:vehicle/repository/extra_repository.dart';
import 'package:vehicle/repository/extra_repository_dummy_impl.dart';
import 'package:vehicle/repository/tire_repository.dart';
import 'package:vehicle/repository/tire_repository_dummy_impl.dart';
import 'package:vehicle/repository/type_repository.dart';
import 'package:vehicle/repository/type_repository_dummy_impl.dart';

void main() {
  GetIt.instance.registerSingleton<TypeRepository>(TypeRepositoryDummyImpl());
  GetIt.instance.registerSingleton<TireRepository>(TireRepositoryDummyImpl());
  GetIt.instance.registerSingleton<ExtraRepository>(ExtraRepositoryDummyImpl());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});
  final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vehicle',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, height: 0.8),
          labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 0.8),
          bodyLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 0.8),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      home: FirstPageWidget(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("Tune your vehicle"),
        ),
        body: Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
    );
  }
}

