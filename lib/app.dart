import 'package:flutter/material.dart';
import 'config/themes.dart';
import 'views/home_view.dart';
import 'views/settings_view.dart';
import 'views/notes_view.dart';
import 'views/alarms_view.dart';
import 'controllers/theme_controller.dart';

class PanfiloApp extends StatelessWidget {
  const PanfiloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Pánfilo',
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: mode,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeView(),
            '/settings': (context) => const SettingsView(),
            // '/notes': (context) => const NotesView(),
            // '/alarms': (context) => const AlarmsView(),
          },
        );
      },
    );
  }
}
