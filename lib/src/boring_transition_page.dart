import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:boring_app/src/boring_params.dart';

typedef BoringRoutePageBuilder = Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    BoringParams params);

class BoringTransitionPage extends CustomTransitionPage {
  const BoringTransitionPage(
      {required Widget child,
      LocalKey? key,
      required this.params,
      required this.pageBuilder,
      required Widget Function(
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child)
          transitionsBuilder})
      : super(child: child, transitionsBuilder: transitionsBuilder, key: key);

  const BoringTransitionPage.defaultTransition({
    LocalKey? key,
    required BoringRoutePageBuilder pageBuilder,
    required BoringParams params,
  }) : this(
            key: key,
            pageBuilder: pageBuilder,
            params: params,
            child: const SizedBox(),
            transitionsBuilder: _defaultTransitionBuilder);

  final BoringParams params;
  final BoringRoutePageBuilder pageBuilder;

  static Widget _defaultTransitionBuilder(
          context, animation, secondaryAnimation, child) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) =>
          pageBuilder(context, animation, secondaryAnimation, params),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
