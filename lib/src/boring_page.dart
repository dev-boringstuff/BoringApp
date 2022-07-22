import 'package:boring_app/boring_app.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoringPage<T> {
  static String? _noRedirection(GoRouterState state) => null;
  const BoringPage(
      {required this.path,
      this.scaffold,
      this.redirect = _noRedirection,
      this.pages = const []})
      : assert(scaffold != null || redirect != _noRedirection,
            'Both pageBuilder and redirect cannot be null');
  final String path;
  final List<BoringPage> pages;
  //final BoringRoutePageBuilder? pageBuilder;
  final String? Function(GoRouterState) redirect;
  final BoringScaffold<T> Function(Animation<double>, BoringParams)? scaffold;
  GoRoute get route => GoRoute(
        redirect: redirect,
        path: path,
        pageBuilder: (context, state) => BoringTransitionPage.defaultTransition(
          key: state.pageKey,
          pageBuilder: (context, animation, secondaryAnimation, params) =>
              scaffold?.call(animation, params) ?? const SizedBox.shrink(),
          params: BoringParams(
              pathParams: state.params, queryParams: state.queryParams),
        ),
        routes: pages.map((page) => page.route).toList(),
      );
}
