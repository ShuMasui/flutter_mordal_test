part of '../router.dart';

class CreateScreenRouteData extends GoRouteData with $CreateScreenRouteData {
  const CreateScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateScreen();
  }
}
