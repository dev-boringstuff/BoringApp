import 'package:flutter/material.dart';

class BoringScaffold extends StatelessWidget {
  const BoringScaffold({
    this.transitionAnimation,
    this.appBar,
    this.floatingActionButtonLocation,
    required this.body,
    required this.drawer,
    this.floatinActionButton,
    Key? key,
  }) : super(key: key);
  final AppBar? appBar;
  final Drawer drawer;
  final Widget body;
  final Widget? floatinActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Animation<double>? transitionAnimation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
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
                ));
    }));
  }
}
