import 'package:boring_app/boring_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoringApp<int>(
      pages: [
        BoringPage(path: '/', redirect: (_) => "/home"),
        BoringPage(
          path: "/home",
          scaffold: (animation, params) => BoringScaffold(
            boringGuard: (p0) {
              print(p0);
            },
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
              ),
            ),
          ),
        ),
        BoringPage(
          path: "/A",
          scaffold: (animation, params) => BoringScaffold(
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
              scaffold: (animation, params) => BoringScaffold(
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
                    child: Center(child: Text(params.pathParams['id'] ?? "")),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
