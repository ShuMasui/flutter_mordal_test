part of '../router.dart';

class EditModalRouteData extends GoRouteData with $EditModalRouteData {
  const EditModalRouteData({this.diary});

  final Diary? diary;

  @override
  Page<bool> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: build(context, state), fullscreenDialog: true);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return diary != null ? EditModal(diary: diary!) : const SizedBox.shrink();
  }
}
