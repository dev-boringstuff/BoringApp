import 'package:boring_app/src/boring_page.dart';
import 'package:boring_app/src/providers/boring_status_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BoringApp<T> extends StatelessWidget {
  BoringApp(
      {Key? key,
      /*required this.drawer,*/ this.initialState,
      required this.pages})
      : _router = GoRouter(routes: pages.map((page) => page.route).toList()),
        super(key: key);
  //ADD ROUTES TO THE DRAWER DYNAMICALLY
  //final BoringDrawer drawer;
  final List<BoringPage<T>> pages;
  final GoRouter _router;
  final T? initialState;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<BoringStatusProvider<T>>(
            create: (_) => BoringStatusProvider<T>()),
      ],
      child: Builder(builder: (context) {
        if (initialState != null) {
          final boringStatusProvider =
              Provider.of<BoringStatusProvider<T>>(context);
          boringStatusProvider.setLogStatus(initialState as T);
        }

        return MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          routeInformationProvider: _router.routeInformationProvider,
        );
      }),
    );
  }
}
