import 'package:flutter/material.dart';

enum AlarmSound {
  gentle('gentle', 'Gentle'),
  classic('classic', 'Classic'),
  digital('digital', 'Digital'),
  bells('bells', 'Bells');

  final String id;
  final String displayName;

  const AlarmSound(this.id, this.displayName);
}

/// Simple alarm audio service that manages alarm state
/// Audio playback is handled by platform-specific system calls
class AlarmAudioService {
  static final AlarmAudioService _instance = AlarmAudioService._internal();
  bool _isPlaying = false;
  AlarmSound? _currentSound;

  AlarmAudioService._internal();

  factory AlarmAudioService() {
    return _instance;
  }

  Future<void> initialize() async {
    debugPrint('Audio service initialized');
  }

  /// Starts alarm playback with the specified sound
  Future<void> playAlarm(AlarmSound sound) async {
    try {
      if (_isPlaying && _currentSound == sound) {
        debugPrint('Alarm already playing with ${sound.displayName}');
        return;
      }

      if (_isPlaying) {
        await stopAlarm();
      }

      _currentSound = sound;
      _isPlaying = true;
      debugPrint('Alarm playing: ${sound.displayName}');
      
      // In a production app, this would trigger native audio playback
      // via platform channels or a native plugin
    } catch (e) {
      debugPrint('Error playing alarm: $e');
      _isPlaying = false;
    }
  }

  /// Stops alarm playback
  Future<void> stopAlarm() async {
    try {
      _isPlaying = false;
      _currentSound = null;
      debugPrint('Alarm stopped');
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  /// Returns whether an alarm is currently playing
  bool get isPlaying => _isPlaying;

  /// Returns the currently playing alarm sound, or null if no alarm is playing
  AlarmSound? get currentSound => _currentSound;

  /// Cleanup when service is disposed
  Future<void> dispose() async {
    try {
      await stopAlarm();
    } catch (e) {
      debugPrint('Error disposing audio service: $e');
    }
  }
}
