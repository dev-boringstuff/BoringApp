import 'package:go_router/go_router.dart';
import 'package:boring_app/src/boring_params.dart';
import 'package:boring_app/src/boring_transition_page.dart';

class BoringPage {
  static String? _noRedirection(GoRouterState state) => null;
  const BoringPage(
      {required this.path,
      this.pageBuilder,
      this.redirect = _noRedirection,
      this.pages = const []})
      : assert(pageBuilder != null || redirect != _noRedirection,
            'Both pageBuilder and redirect cannot be null');
  final String path;
  final List<BoringPage> pages;
  final BoringRoutePageBuilder? pageBuilder;
  final String? Function(GoRouterState) redirect;
  GoRoute get route => GoRoute(
        redirect: redirect,
        path: path,
        pageBuilder: (context, state) => BoringTransitionPage.defaultTransition(
            key: state.pageKey,
            pageBuilder: pageBuilder!,
            params: BoringParams(
                pathParams: state.params, queryParams: state.queryParams)),
        routes: pages.map((page) => page.route).toList(),
      );
}
