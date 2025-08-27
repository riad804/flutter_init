import 'package:go_router/go_router.dart';

import '../../core/common/widgets/base_tab_screen.dart';
import 'get_bottom_sheet_routes.dart';

final shellRoutes = ShellRoute(
  builder: (context, state, child) {
    return BaseTabScreen(child: child);
  },
  routes: navigationModel.generateRoutes(),
);