import 'package:flutter/material.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  // Lista temporal de alarmas simuladas
  final List<Map<String, dynamic>> _alarms = [
    {'time': TimeOfDay(hour: 7, minute: 0), 'enabled': true},
    {'time': TimeOfDay(hour: 9, minute: 30), 'enabled': false},
    {'time': TimeOfDay(hour: 17, minute: 45), 'enabled': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alarmas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _alarms.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final alarm = _alarms[index];
          final time = alarm['time'] as TimeOfDay;
          final enabled = alarm['enabled'] as bool;

          return ListTile(
            leading: Icon(
              Icons.alarm,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              time.format(context),
              style: const TextStyle(fontSize: 20),
            ),
            trailing: Switch(
              value: enabled,
              onChanged: (value) {
                setState(() => _alarms[index]['enabled'] = value);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Placeholder para agregar nueva alarma
          final newTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (newTime != null) {
            setState(() {
              _alarms.add({'time': newTime, 'enabled': true});
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
