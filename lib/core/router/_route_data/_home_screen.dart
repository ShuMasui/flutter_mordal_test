part of '../router.dart';

class HomeScreenRouteData extends GoRouteData with $HomeScreenRouteData {
  const HomeScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}
