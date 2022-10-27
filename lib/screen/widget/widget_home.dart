import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_widget.dart';

class _HomeBottomNavigationBarItem extends StatelessWidget {
  const _HomeBottomNavigationBarItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: child,
      ),
    );
  }
}

class HomeBottomNavigationBar extends DefaultAppBar {
  const HomeBottomNavigationBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CupertinoTabBar(
      onTap: onTap,
      iconSize: 24.0,
      currentIndex: currentIndex,
      height: preferredSize.height,
      backgroundColor: Colors.transparent,
      border: Border(top: BorderSide(color: theme.dividerColor)),
      items: [
        const BottomNavigationBarItem(
          activeIcon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.shopping_cart),
          ),
          icon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.shopping_cart),
          ),
          label: 'Restos',
        ),
        const BottomNavigationBarItem(
          activeIcon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.bell_fill),
          ),
          icon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.bell),
          ),
          label: 'Notifcations',
        ),
        BottomNavigationBarItem(
          icon: _HomeBottomNavigationBarItem(
            child: CustomCircleAvatar(
              backgroundColor: theme.colorScheme.onSurface,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: theme.colorScheme.secondary, width: 4.0),
              ),
              child: CustomButton(
                onPressed: () {},
                color: theme.colorScheme.surface,
                child: const Icon(CupertinoIcons.qrcode_viewfinder),
              ),
            ),
          ),
        ),
        const BottomNavigationBarItem(
          activeIcon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.location_north_fill),
          ),
          icon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.location_north),
          ),
          label: 'Recherche',
        ),
        const BottomNavigationBarItem(
          activeIcon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.person_crop_circle_fill),
          ),
          icon: _HomeBottomNavigationBarItem(
            child: Icon(CupertinoIcons.person_crop_circle),
          ),
          label: 'Profil',
        ),
      ],
    );
  }
}
