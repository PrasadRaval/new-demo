

// import 'package:dash_bubble/dash_bubble.dart';
// import 'package:floating_overlay/floating_overlay.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:system_alert_window/system_alert_window.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // SpeedDial buildSpeedDial() {
//   //   return SpeedDial(
//   //     animatedIcon: AnimatedIcons.menu_close,
//   //     animatedIconTheme: const IconThemeData(size: 22),
//   //     backgroundColor: Colors.blue,
//   //     visible: true,
//   //     curve: Curves.bounceIn,
//   //     children: [
//   //       SpeedDialChild(
//   //         child: Icon(Icons.accessibility),
//   //         backgroundColor: Colors.red,
//   //         onTap: () {
//   //           SystemWindowHeader header = SystemWindowHeader(
//   //               title: SystemWindowText(
//   //                   text: "Incoming Call",
//   //                   fontSize: 10,
//   //                   textColor: Colors.black45),
//   //               padding: SystemWindowPadding.setSymmetricPadding(12, 12),
//   //               subTitle: SystemWindowText(
//   //                   text: "9898989899",
//   //                   fontSize: 14,
//   //                   fontWeight: FontWeight.BOLD,
//   //                   textColor: Colors.black87),
//   //               decoration: SystemWindowDecoration(startColor: Colors.grey[100]),
//   //               button: SystemWindowButton(
//   //                   text: SystemWindowText(
//   //                       text: "Click the button",
//   //                       fontSize: 10,
//   //                       textColor: Colors.black45),
//   //                   tag: "btn_click"),
//   //               buttonPosition: ButtonPosition.TRAILING);
//   //           SystemAlertWindow.showSystemWindow(
//   //               height: 80,
//   //               header: header,
//   //               margin:
//   //               SystemWindowMargin(left: 8, right: 8, top: 200, bottom: 0),
//   //               gravity: SystemWindowGravity.TOP,
//   //               backgroundColor: Colors.black12,
//   //               isDisableClicks: false);
//   //         },
//   //         label: 'First Child',
//   //         labelStyle:
//   //         const TextStyle(),
//   //         labelBackgroundColor:
//   //         Colors.redAccent,
//   //       ), SpeedDialChild(
//   //         child: const Icon(Icons.brush),
//   //         backgroundColor: Colors.blue,
//   //         onTap: () => print('SECOND CHILD'),
//   //         label: 'Second Child',
//   //         labelStyle: const TextStyle(),
//   //         labelBackgroundColor: Colors.blueAccent,
//   //       ),
//   //       SpeedDialChild(
//   //         child: const Icon(Icons.keyboard_voice),
//   //         backgroundColor: Colors.green,
//   //         onTap: () => print('THIRD CHILD'),
//   //         labelWidget: Container(
//   //           color: Colors.white,
//   //           margin: const EdgeInsets.only(right: 10),
//   //           padding:
//   //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//   //           child:
//   //           const Text('Custom Label Widget', style:
//   //           TextStyle(color:
//   //           Colors.black)),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Demo"),
//       ),
//       body:
//       const Center(child:
//       Text('Press the button below!')),
//     );
//   }
// }
