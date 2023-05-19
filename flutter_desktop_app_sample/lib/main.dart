import 'dart:io';
import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppWindow appWindow = AppWindow();
  final SystemTray systemTray = SystemTray();

  @override
  void initState() {
    super.initState();
    initSystemTray();
  }

  Future<void> initSystemTray() async {
    await systemTray.initSystemTray(
        title: 'Flutter', iconPath: 'assets/app_icon.png', toolTip: 'ToolTip');

    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(label: 'メニュー1', onClicked: (menuItem) => {}),
      MenuItemLabel(label: 'メニュー2', onClicked: (menuItem) => {}),
      MenuItemLabel(label: 'メニュー3', onClicked: (menuItem) => {}),
    ]);
    await systemTray.setContextMenu(menu);

    systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? appWindow.show() : systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? systemTray.popUpContextMenu() : appWindow.show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'System Tray App Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
