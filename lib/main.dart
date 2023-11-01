import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Dark Theme Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.deepPurple,
                textTheme: const TextTheme(
                    headlineMedium:
                        TextStyle(color: Colors.black54, fontSize: 20))),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                textTheme: const TextTheme(
                  headlineMedium:
                      TextStyle(color: Colors.white60, fontSize: 20),
                )),
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
