import 'package:boring_app/src/boring_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoringApp extends StatelessWidget {
  BoringApp({Key? key, /*required this.drawer,*/ required this.pages})
      : _router = GoRouter(routes: pages.map((page) => page.route).toList()),
        super(key: key);
  //ADD ROUTES TO THE DRAWER DYNAMICALLY
  //final BoringDrawer drawer;
  final List<BoringPage> pages;
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
