import 'package:contacts_app/ui/screens/create_update_contact.dart';
import 'package:core/core.dart';
import 'package:contacts_app/ui/screens/contacts_list.dart';
import 'package:contacts_app/ui/screens/detail_contact.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String init = '/';
  static const String detail = '/detail';
  static const String edit = '/edit';
}

final GoRouter router = GoRouter(
  initialLocation: Routes.init,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.init,
      builder: (BuildContext context, GoRouterState state) {
        return ContactListScreen();
      },

    ),
    GoRoute(
      path: Routes.detail,
      builder: (BuildContext context, GoRouterState state) {
        return DetailContact(model: state.extra as ContactModel);
      },
    ),
    GoRoute(
      path: Routes.edit,
      builder: (BuildContext context, GoRouterState state) {
        return CreateUpdateContactScreen(contactModel: state.extra as ContactModel?);
      },
    ),
  ],

);
