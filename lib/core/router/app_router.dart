import 'package:go_router/go_router.dart';
import 'package:sachin_portfolio/features/home/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
  );
}
