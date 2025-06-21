import 'package:flutter/material.dart';
import 'app.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.loadTheme(); // Tema general de la app
  runApp(const PanfiloApp());
}
