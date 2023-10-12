
import 'package:session_2/prisentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:session_2/prisentation/pages/news.dart';
import 'package:session_2/utils/routing_constants.dart';
class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: news,
        builder: (context, state) => const News(),
      ),
    ],
    errorBuilder: (context, state) {return const HomePage();},
  );
}