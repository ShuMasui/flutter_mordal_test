// Router configuration

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_mordal_test/core/type/diary.dart';
import 'package:flutter_mordal_test/feature/features.dart';

part './_route_data/_branches.dart';
part './_route_data/_create_modal.dart';
part './_route_data/_create_screen.dart';
part './_route_data/_home_screen.dart';
part './_route_data/_edit_modal.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(initialLocation: '/home', routes: $appRoutes);
}

@TypedStatefulShellRoute<AppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranchData>(
      routes: <TypedRoute<GoRouteData>>[
        TypedGoRoute<HomeScreenRouteData>(path: '/home', name: 'home'),
        TypedGoRoute<EditModalRouteData>(
          path: '/edit/modal/:diary',
          name: 'edit_modal',
        ),
      ],
    ),
    TypedStatefulShellBranch<CreateBranchData>(
      routes: <TypedRoute<GoRouteData>>[
        TypedGoRoute<CreateScreenRouteData>(path: '/create', name: 'create'),
        TypedGoRoute<CreateModalRouteData>(
          path: '/create/modal/:diary',
          name: 'create_modal',
        ),
      ],
    ),
  ],
)
class AppRouter extends StatefulShellRouteData {
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return PopScope(
      canPop: false,
      child: BtmBar(navigationShell: navigationShell),
    );
  }
}
