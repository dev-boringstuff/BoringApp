import 'package:boring_app/boring_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoringApp(
      pages: [
        BoringPage(path: '/', redirect: (_) => "/home"),
        BoringPage(
          path: "/home",
          pageBuilder: (context, animation, secondaryAnimation, params) =>
              BoringScaffold(
                  transitionAnimation: animation,
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerTop,
                  floatinActionButton: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                  drawer: BoringDrawer(0),
                  body: Container(
                      color: Colors.yellow,
                      child: const Center(
                        child: Center(),
                      ))),
        ),
        BoringPage(
            path: "/A",
            pageBuilder: (context, animation, secondaryAnimation, params) =>
                BoringScaffold(
                    transitionAnimation: animation,
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerTop,
                    floatinActionButton: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                    drawer: BoringDrawer(1),
                    body: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Center(),
                        ))),
            pages: [
              BoringPage(
                  path: ":id",
                  pageBuilder: (context, animation, secondaryAnimation,
                          params) =>
                      BoringScaffold(
                          appBar: AppBar(
                            title: Text(params.pathParams['id'] ?? ""),
                          ),
                          transitionAnimation: animation,
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.centerTop,
                          floatinActionButton: FloatingActionButton(
                            child: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                          drawer: BoringDrawer(1),
                          body: Container(
                            color: Colors.green,
                            child: Center(
                              child: Center(
                                  child: Text(params.pathParams['id'] ?? "")),
                            ),
                          )))
            ])
      ],
    );
  }
}
