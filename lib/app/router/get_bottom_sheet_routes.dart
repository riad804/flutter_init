import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavItem {
  final String id;
  final String title;
  final IconData icon;
  final String route;

  NavItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.route,
  });
}

class NavigationModel {
  final List<NavItem> navItems;

  NavigationModel() : navItems = [
    NavItem(
      id: 'home',
      title: 'Home',
      icon: Icons.home,
      route: '/home',
    ),
    NavItem(
      id: 'feed',
      title: 'Feed',
      icon: Icons.rss_feed,
      route: '/feed',
    ),
    NavItem(
      id: 'profile',
      title: 'Profile',
      icon: Icons.person,
      route: '/profile',
    ),
    NavItem(
      id: 'settings',
      title: 'Settings',
      icon: Icons.settings,
      route: '/settings',
    ),
  ];

  // Generate routes dynamically based on navItems
  List<RouteBase> generateRoutes() {
    final routes = <RouteBase>[];

    for (final item in navItems) {
      routes.add(
        GoRoute(
          path: item.route,
          builder: (context, state) => Container(),
          routes: [
            GoRoute(
              path: 'details',
              builder: (context, state) => Container(),
            ),
          ],
        ),
      );
    }

    return routes;
  }

  // Find nav item by route path
  NavItem getNavItemByPath(String path) {
    return navItems.firstWhere(
          (item) => item.route == path,
      orElse: () => navItems.first,
    );
  }
}


final navigationModel = NavigationModel();