// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
//
// final FlutterLocalNotificationsPlugin localNotification =
//     FlutterLocalNotificationsPlugin();
//
// class MyNotification {
//   static Future<void> initialize(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidInitialize =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOSInitialize = const IOSInitializationSettings();
//     var initializationsSettings =
//         InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//     flutterLocalNotificationsPlugin.initialize(initializationsSettings,
//         onSelectNotification: (String? payload) async {
//       try {
//         await requestIOSPermissions();
//         // if (payload != null && payload.isNotEmpty) {
//         //   MyApp.navigatorKey.currentState.push(MaterialPageRoute(
//         //       builder: (context) => OrderDetailsScreen(
//         //           orderId: int.parse(payload), orderType: 'default_type')));
//         // }
//       } catch (e) {}
//       return;
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showTextNotification(message, flutterLocalNotificationsPlugin);
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       try {
//         if (message.notification?.titleLocKey != null &&
//             message.notification?.titleLocKey?.isNotEmpty == true) {
//           // MyApp.navigatorKey.currentState.push(MaterialPageRoute(
//           //     builder: (context) => OrderDetailsScreen(
//           //         orderId: int.parse(message.notification.titleLocKey),
//           //         orderType: 'default_type')));
//         }
//       } catch (e) {}
//     });
//   }
//
//   static Future<void> requestIOSPermissions() async {
//     await localNotification
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   // static Future<void> showNotification(RemoteMessage message,
//   //     FlutterLocalNotificationsPlugin fln, bool data) async {
//   //   String? _title;
//   //   String? _body;
//   //   String? _orderID;
//   //   String? _image;
//   //   if (data) {
//   //     _title = message.data['title'];
//   //     _body = message.data['body'];
//   //     _orderID = message.data['order_id'];
//   //     _image = (message.data['image'] != null &&
//   //             message.data['image'].isNotEmpty)
//   //         ? message.data['image'].startsWith('http')
//   //             ? message.data['image']
//   //             : '${AppConstants.baseurlImages}/storage/app/public/notification/${message.data['image']}'
//   //         : null;
//   //   } else {
//   //     _title = message.notification.title;
//   //     _body = message.notification.body;
//   //     _orderID = message.notification.titleLocKey;
//   //     if (Platform.isAndroid) {
//   //       _image = (message.notification.android.imageUrl != null &&
//   //               message.notification.android.imageUrl.isNotEmpty)
//   //           ? message.notification.android.imageUrl.startsWith('http')
//   //               ? message.notification.android.imageUrl
//   //               : '${AppConstants.baseurlImages}/storage/app/public/notification/${message.notification.android.imageUrl}'
//   //           : null;
//   //     } else if (Platform.isIOS) {
//   //       _image = (message.notification.apple.imageUrl != null &&
//   //               message.notification?.apple.imageUrl.isNotEmpty)
//   //           ? message.notification?.apple?.imageUrl?.startsWith('http')
//   //               ? message.notification?.apple?.imageUrl
//   //               : '${AppConstants.baseurlImages}/storage/app/public/notification/${message.notification?.apple?.imageUrl}'
//   //           : null;
//   //     }
//   //   }
//   //
//   //   if (_image != null && _image.isNotEmpty) {
//   //     try {
//   //       await showBigPictureNotificationHiddenLargeIcon(
//   //           _title!, _body!, _orderID!, _image, fln);
//   //     } catch (e) {
//   //       await showBigTextNotification(_title!, _body!, _orderID!, fln);
//   //     }
//   //   } else {
//   //     await showBigTextNotification(_title!, _body!, _orderID!, fln);
//   //   }
//   // }
//
//   static Future<void> showTextNotification(
//       RemoteMessage message, FlutterLocalNotificationsPlugin fln) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         const AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       "",
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.max,
//       // sound: RawResourceAndroidNotificationSound('notification'),
//     );
//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await fln.show(
//       0,
//       message.data["title"],
//       message.data["body"],
//       platformChannelSpecifics,
//     );
//   }
//
//   static Future<void> showBigTextNotification(String title, String body,
//       String orderID, FlutterLocalNotificationsPlugin fln) async {
//     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//       body,
//       htmlFormatBigText: true,
//       contentTitle: title,
//       htmlFormatContentTitle: true,
//     );
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       "",
//       importance: Importance.max,
//       styleInformation: bigTextStyleInformation,
//       priority: Priority.max,
//       playSound: true,
//       sound: const RawResourceAndroidNotificationSound('notification'),
//     );
//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
//   }
//
//   static Future<void> showBigPictureNotificationHiddenLargeIcon(
//       String title,
//       String body,
//       String orderID,
//       String image,
//       FlutterLocalNotificationsPlugin fln) async {
//     final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
//     final String bigPicturePath =
//         await _downloadAndSaveFile(image, 'bigPicture');
//     final BigPictureStyleInformation bigPictureStyleInformation =
//         BigPictureStyleInformation(
//       FilePathAndroidBitmap(bigPicturePath),
//       hideExpandedLargeIcon: true,
//       contentTitle: title,
//       htmlFormatContentTitle: true,
//       summaryText: body,
//       htmlFormatSummaryText: true,
//     );
//     final AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       "",
//       largeIcon: FilePathAndroidBitmap(largeIconPath),
//       priority: Priority.max,
//       playSound: true,
//       styleInformation: bigPictureStyleInformation,
//       importance: Importance.max,
//       // sound: RawResourceAndroidNotificationSound('notification'),
//     );
//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
//   }
//
//   static Future<String> _downloadAndSaveFile(
//       String url, String fileName) async {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String filePath = '${directory.path}/$fileName';
//     final Response response = await Dio()
//         .get(url, options: Options(responseType: ResponseType.bytes));
//     final File file = File(filePath);
//     await file.writeAsBytes(response.data);
//     return filePath;
//   }
// }
//
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
// }
