// lib/core/services/notification_service.dart
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'alarm_audio_service.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  static Future<void> _initialize() async {
    if (_initialized) return;

    tz.initializeTimeZones();

    // 2. GET THE LOCAL TIMEZONE STRING
    // Fix: getLocalTimezone() returns a String, not an object.
    final TimezoneInfo localTimeZoneInfo = await FlutterTimezone.getLocalTimezone();

    final String localTimeZone = localTimeZoneInfo.identifier;
    tz.setLocalLocation(tz.getLocation(localTimeZone));

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    final notificationsGranted = await androidPlugin?.requestNotificationsPermission();
    if (notificationsGranted == false) {
      throw Exception('Notification permission was denied.');
    }

    final canScheduleExact = await androidPlugin?.canScheduleExactNotifications();
    if (canScheduleExact == false) {
      final exactGranted = await androidPlugin?.requestExactAlarmsPermission();
      if (exactGranted == false) {
        throw Exception('Exact alarm permission was denied.');
      }
    }

    await _plugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    _initialized = true;
  }

  static Future<void> scheduleWakeAlarm(TimeOfDay alarmTime, int smartWindowMinutes,
      [AlarmSound sound = AlarmSound.gentle]) async {
    await _initialize();

    final scheduledDate = _nextInstanceOfTime(alarmTime);
    const androidDetails = AndroidNotificationDetails(
      'smart_alarm_channel',
      'Smart Alarm',
      channelDescription: 'Smart alarm notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );
    const iosDetails = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      id: 0,
      title: 'Wake up',
      body:
          'Alarm set for ${_formatTime(alarmTime)}. Smart wake window: $smartWindowMinutes minutes.',
      scheduledDate: tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails: notificationDetails,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static DateTime _nextInstanceOfTime(TimeOfDay time) {
    final now = DateTime.now();
    final scheduled = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return scheduled.isBefore(now) || scheduled.isAtSameMomentAs(now)
        ? scheduled.add(const Duration(days: 1))
        : scheduled;
  }

  static String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
