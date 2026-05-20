part of '../router.dart';

class CreateModalRouteData extends GoRouteData with $CreateModalRouteData {
  const CreateModalRouteData({this.diary});

  final Diary? diary;

  @override
  Page<bool> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: build(context, state), fullscreenDialog: true);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return diary != null ? Createmodal(diary: diary!) : const SizedBox.shrink();
  }
}
