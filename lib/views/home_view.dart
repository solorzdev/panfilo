import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pánfilo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿En qué puedo ayudarte?',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Micrófono
            CircleAvatar(
              radius: 45,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                icon: const Icon(Icons.mic, size: 40, color: Colors.white),
                onPressed: () {
                  // Aquí vamos a invocar el reconocimiento de voz
                },
              ),
            ),

            const SizedBox(height: 20),

            // Placeholder de animación de voz
            Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              child: const Text(
                '⎯⎯⎯⎯⎯⎯', // Puedes reemplazarlo por una onda animada luego
                style: TextStyle(fontSize: 32, letterSpacing: 2),
              ),
            ),

            const SizedBox(height: 50),

            // Botones de acceso rápido
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.note),
                  label: const Text('Notas'),
                  onPressed: () => Navigator.pushNamed(context, '/notes'),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.alarm),
                  label: const Text('Alarmas'),
                  onPressed: () => Navigator.pushNamed(context, '/alarms'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
