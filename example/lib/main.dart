import 'package:boring_app/boring_app.dart';
import 'package:example/boring_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoringApp<int>(
      initialState: 0,
      pages: [
        BoringPage(path: '/', redirect: (_) => "/home"),
        BoringPage(
          path: "/home",
          scaffold: (pckContext, animation, params) => BoringScaffold(
            boringGuard: (p0) {
              print(p0);
            },
            transitionAnimation: animation,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerTop,
            floatinActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                final boringStatusProvider =
                    Provider.of<BoringStatusProvider<int>>(pckContext,
                        listen: false);

                boringStatusProvider.setLogStatus(42);

                print(
                    'Boring status now is: ${boringStatusProvider.status.toString()}');
              },
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
          scaffold: (pckContext, animation, params) => BoringScaffold(
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
              scaffold: (pckContext, animation, params) => BoringScaffold(
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
