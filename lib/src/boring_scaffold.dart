import 'package:boring_app/src/providers/boring_status_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoringScaffold<T> extends StatelessWidget {
  const BoringScaffold({
    this.transitionAnimation,
    this.boringGuard,
    this.appBar,
    this.floatingActionButtonLocation,
    required this.body,
    required this.drawer,
    this.floatinActionButton,
    Key? key,
  }) : /*assert(boringGuard == null || T != dynamic,
            "If boringGuard is not null, then you have to specify the generic class T in BoringApp"),*/
        super(key: key);
  final AppBar? appBar;
  final Drawer drawer;
  final Widget body;
  final Function(T?)? boringGuard;
  final Widget? floatinActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Animation<double>? transitionAnimation;

  @override
  Widget build(BuildContext context) {
    if (boringGuard != null) {
      final boringStatusProvider =
          Provider.of<BoringStatusProvider<T>>(context);

      boringGuard?.call(boringStatusProvider.status);
    }

    return LayoutBuilder(
      builder: ((context, constraints) {
        final bool isSmall = constraints.maxWidth < 1000;
        final Widget bodyContent = transitionAnimation == null
            ? body
            : AnimatedBuilder(
                animation: transitionAnimation!,
                builder: (context, child) {
                  return SlideTransition(
                      position: transitionAnimation!.drive(
                        Tween(begin: const Offset(1, 0), end: Offset.zero)
                            .chain(CurveTween(curve: Curves.ease)),
                      ),
                      child: body);
                },
                child: body);
        return Scaffold(
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatinActionButton,
          appBar: appBar,
          drawer: isSmall ? drawer : null,
          body: isSmall
              ? body
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [drawer, Expanded(child: bodyContent)],
                ),
        );
      }),
    );
  }
}
