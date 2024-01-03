import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';

class LocalNotificationHelper {
  LocalNotificationHelper._();

  static final LocalNotificationHelper localNotificationHelper =
      LocalNotificationHelper._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initLocalNotification() async {
    tz.initializeTimeZones();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      print('=============');
      print(notificationResponse.payload);
      print('=============');
    });
  }

  Future<void> showSimpleNotification() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'id',
      'channel',
      channelDescription: 'description',
      priority: Priority.high,
      importance: Importance.max,
    );
    DarwinNotificationDetails iOS = DarwinNotificationDetails();
    NotificationDetails platform =
        NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Simple Notification', 'Dummy Content', platform,
        payload: "This is click on notification");
  }

  Future<void> showScheduleNotification() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'id',
      'channel',
      channelDescription: 'description',
      priority: Priority.high,
      importance: Importance.max,
    );
    DarwinNotificationDetails iOS = DarwinNotificationDetails();
    NotificationDetails platform =
        NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Schedule Notification",
        "Dummy Content",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        platform,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> showBigPictureNotification() async {
    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("mipmap/ic_launcher"),
      largeIcon: DrawableResourceAndroidBitmap("mipmap/ic_launcher"),
    );

    AndroidNotificationDetails android = AndroidNotificationDetails(
      'id',
      'channel',
      channelDescription: 'description',
      priority: Priority.high,
      importance: Importance.max,
      styleInformation: bigPictureStyleInformation,
    );
    NotificationDetails platform =
        NotificationDetails(android: android, iOS: null);

    await flutterLocalNotificationsPlugin.show(
        0, 'BigPicture Notification', 'Dummy Content', platform,
        payload: "This is click on notification");
  }

  Future<void> showMediaNotification() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'id',
      'channel',
      channelDescription: 'description',
      priority: Priority.high,
      importance: Importance.max,
      color: Colors.red,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap('mipmap/ic_launcher'),
    );
    NotificationDetails platform =
        NotificationDetails(android: android, iOS: null);

    await flutterLocalNotificationsPlugin.show(
        0, 'Media Notification', 'Dummy Content', platform,
        payload: "This is click on notification");
  }
}
