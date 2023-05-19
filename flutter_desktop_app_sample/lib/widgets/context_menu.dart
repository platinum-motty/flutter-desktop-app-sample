import 'package:flutter/material.dart';
import 'package:native_context_menu/native_context_menu.dart';

class ContextMenu extends StatelessWidget {
  final Widget child;
  const ContextMenu({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegion(
      onItemSelected: (item) {
        // それぞれに対応した処理を書く
        switch (item.title) {
          case 'メニュー1':
          case 'メニュー2':
          case 'メニュー3':
            break;
        }
      },
      menuItems: [
        MenuItem(
          title: 'メニュー1',
        ),
        MenuItem(
          title: 'メニュー2',
        ),
        MenuItem(
          title: 'メニュー3',
        ),
      ],
      child: child,
    );
  }
}
