// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// removed unused import
import '../../../sleep_tracking/data/repositories/sleep_session_repository.dart';

class EditSessionScreen extends ConsumerStatefulWidget {
  const EditSessionScreen({super.key, required this.sessionId});

  final int sessionId;

  @override
  ConsumerState<EditSessionScreen> createState() => _EditSessionScreenState();
}

class _EditSessionScreenState extends ConsumerState<EditSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _sleepTime;
  DateTime? _wakeTime;

  @override
  void initState() {
    super.initState();
    // Load session
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final repo = SleepSessionRepository();
      final s = await repo.getSessionById(widget.sessionId);
      if (s != null) {
        setState(() {
          _sleepTime = s.sleepTime;
          _wakeTime = s.wakeTime;
        });
      }
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_sleepTime == null || _wakeTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select both sleep and wake times'),
      ));
      return;
    }
    // Save minimal edits: sleep/wake times
    final repo = SleepSessionRepository();
    await repo.updateSessionTimes(widget.sessionId, _sleepTime!, _wakeTime!);
    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: Text('Sleep Time', style: GoogleFonts.outfit()),
                subtitle: Text(
                    _sleepTime != null ? _sleepTime.toString() : 'Loading'),
                onTap: () async {
                  // ignore: use_build_context_synchronously
                  final dt = await showDatePicker(
                    context: context,
                    initialDate: _sleepTime ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (dt != null) {
                    // ignore: use_build_context_synchronously
                    final t = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            _sleepTime ?? DateTime.now()));
                    if (t != null) {
                      if (!mounted) return;
                      setState(() {
                        _sleepTime = DateTime(
                            dt.year, dt.month, dt.day, t.hour, t.minute);
                      });
                    }
                  }
                },
              ),
              ListTile(
                title: Text('Wake Time', style: GoogleFonts.outfit()),
                subtitle:
                    Text(_wakeTime != null ? _wakeTime.toString() : 'Loading'),
                onTap: () async {
                  // ignore: use_build_context_synchronously
                  final dt = await showDatePicker(
                    context: context,
                    initialDate: _wakeTime ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (dt != null) {
                    // ignore: use_build_context_synchronously
                    final t = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            _wakeTime ?? DateTime.now()));
                    if (t != null) {
                      if (!mounted) return;
                      setState(() {
                        _wakeTime = DateTime(
                            dt.year, dt.month, dt.day, t.hour, t.minute);
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _save, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
