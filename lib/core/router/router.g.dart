// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appRouter];

RouteBase get $appRouter => StatefulShellRouteData.$route(
  factory: $AppRouterExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',
          name: 'home',
          factory: $HomeScreenRouteData._fromState,
        ),
        GoRouteData.$route(
          path: '/edit/modal/:diary',
          name: 'edit_modal',
          factory: $EditModalRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/create',
          name: 'create',
          factory: $CreateScreenRouteData._fromState,
        ),
        GoRouteData.$route(
          path: '/create/modal/:diary',
          name: 'create_modal',
          factory: $CreateModalRouteData._fromState,
        ),
      ],
    ),
  ],
);

extension $AppRouterExtension on AppRouter {
  static AppRouter _fromState(GoRouterState state) => AppRouter();
}

mixin $HomeScreenRouteData on GoRouteData {
  static HomeScreenRouteData _fromState(GoRouterState state) =>
      const HomeScreenRouteData();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditModalRouteData on GoRouteData {
  static EditModalRouteData _fromState(GoRouterState state) =>
      EditModalRouteData(
        diary: (String json0) {
          return Diary.fromJson(jsonDecode(json0) as Map<String, dynamic>);
        }(state.pathParameters['diary'] ?? '')!,
      );

  EditModalRouteData get _self => this as EditModalRouteData;

  @override
  String get location => GoRouteData.$location(
    '/edit/modal/${Uri.encodeComponent(jsonEncode(_self.diary!.toJson()) ?? '')}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateScreenRouteData on GoRouteData {
  static CreateScreenRouteData _fromState(GoRouterState state) =>
      const CreateScreenRouteData();

  @override
  String get location => GoRouteData.$location('/create');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateModalRouteData on GoRouteData {
  static CreateModalRouteData _fromState(GoRouterState state) =>
      CreateModalRouteData(
        diary: (String json0) {
          return Diary.fromJson(jsonDecode(json0) as Map<String, dynamic>);
        }(state.pathParameters['diary'] ?? '')!,
      );

  CreateModalRouteData get _self => this as CreateModalRouteData;

  @override
  String get location => GoRouteData.$location(
    '/create/modal/${Uri.encodeComponent(jsonEncode(_self.diary!.toJson()) ?? '')}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(router)
final routerProvider = RouterProvider._();

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'66fb870ebef770f5650efba5d426e4ae5cc28cf2';
