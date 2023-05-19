import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMenu extends StatelessWidget {
  final Widget child;
  const MyMenu({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: <PlatformMenuItem>[
        PlatformMenu(
          label: 'メニュー0',
          menus: <PlatformMenuItem>[
            PlatformMenuItemGroup(
              members: <PlatformMenuItem>[
                PlatformMenuItem(
                  label: 'メニュー01',
                  onSelected: () {},
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: <PlatformMenuItem>[
                PlatformMenuItem(
                  label: 'メニュー02',
                  onSelected: () {},
                  shortcut: const SingleActivator(LogicalKeyboardKey.keyX,
                      shift: true),
                  // shortcut: const CharacterActivator('m'),
                ),
                PlatformMenu(
                  label: 'メニュー03',
                  menus: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'メニュー03-1',
                      onSelected: () {},
                      // shortcut: const CharacterActivator('a'),
                    ),
                    PlatformMenuItem(
                      label: 'メニュー03-2',
                      // shortcut: const CharacterActivator('b'),
                      onSelected: () {},
                    ),
                  ],
                ),
              ],
            ),
            if (PlatformProvidedMenuItem.hasMenu(
                PlatformProvidedMenuItemType.quit))
              const PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.quit),
          ],
        ),
        PlatformMenu(
          label: 'メニュー1',
          menus: <PlatformMenuItem>[
            PlatformMenuItemGroup(
              members: <PlatformMenuItem>[
                PlatformMenuItem(
                  label: 'メニュー11',
                  onSelected: () {},
                ),
              ],
            ),
          ],
        ),
      ],
      child: child,
    );
  }
}
