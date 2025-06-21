import 'package:flutter/material.dart';
import 'package:panfilo/controllers/theme_controller.dart';
import '../services/preferences_service.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final PreferencesService _preferencesService = PreferencesService();

  bool isDarkMode = false;
  bool voiceResponse = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    isDarkMode = await _preferencesService.getDarkMode();
    voiceResponse = await _preferencesService.getVoiceResponse();
    setState(() {});
  }

  void _updateDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
    _preferencesService.setDarkMode(value);
  }

  void _updateVoiceResponse(bool value) {
    setState(() {
      voiceResponse = value;
    });
    _preferencesService.setVoiceResponse(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Tema oscuro'),
            value: isDarkMode,
            onChanged: (value) {
              setState(() => isDarkMode = value);
              ThemeController.updateTheme(value);
            },
          ),
          SwitchListTile(
            title: const Text('Respuesta por voz'),
            value: voiceResponse,
            onChanged: _updateVoiceResponse,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.language),
            label: const Text('Idioma'),
            onPressed: () {
              // Futuro: selección de idioma
            },
          ),
        ],
      ),
    );
  }
}
