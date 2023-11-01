import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dark Theme Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: AnimatedCrossFade(
              crossFadeState: Theme.of(context).brightness == Brightness.light
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const Icon(
                Icons.wb_sunny_rounded,
                size: 200,
              ),
              secondChild: const Icon(
                Icons.nightlight_round,
                size: 200,
              ),
              duration: const Duration(milliseconds: 500),
            ),
          ),
          RadioListTile<ThemeMode>(
            title: Text(
              'Light Mode',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.light,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.dark,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text(
              'System Mode',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.system,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}
