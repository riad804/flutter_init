import 'package:flutter/material.dart';
import 'package:flutter_init/core/common/widgets/base_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_state_manager/rx_state_manager.dart';

import '../../../app/router/get_bottom_sheet_routes.dart';

class BaseTabScreen extends BaseScreen {
  BaseTabScreen({super.key, required this.child});

  final Widget child;

  final RxVar<int> _indexSubject = RxVar<int>(0);



  @override
  Widget buildScreen(BuildContext context, RxController controller) {
    final location = GoRouterState.of(context).uri.toString();
    _indexSubject.value = (navigationModel.navItems.indexWhere((item) => item.route == location));

    return Scaffold(
      body: child,
      bottomNavigationBar: StreamBuilder(
        stream: _indexSubject.stream,
        builder: (context, snap) {
          return BottomNavigationBar(
            currentIndex: snap.data ?? 0,
            onTap: (index) {
              final route = navigationModel.navItems[index].route;
              context.go(route);
            },
            items: navigationModel.navItems.map((item) {
              return BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.title,
              );
            }).toList(),
          );
        },
      ),
    );
  }  

}

