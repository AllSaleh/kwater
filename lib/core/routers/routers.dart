import 'package:go_router/go_router.dart';
import 'package:khwater/core/routers/router_animation.dart';
import 'package:khwater/core/routers/routers_names.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/add_messge.dart';
import 'package:khwater/features/drwer_pages/settings/view/settings.dart';
import 'package:khwater/features/home/views/home_view.dart';
import 'package:khwater/features/search/view/search_view.dart';
import 'package:khwater/features/spalsh_screen/views/pages/splash_screen_view.dart';

abstract class AppRouters {
  static final routers = GoRouter(routes: [
    GoRoute(
      path: Routers.splash,
      pageBuilder: (context, state) =>
          pageAnimation(page: const SplashScreenView()),
    ),
     GoRoute(
      path: '/${Routers.home}',
      name: Routers.home,
      pageBuilder: (context, state) =>
          pageAnimation(page: const HomeView()),
    ),
     GoRoute(
      path: '/${Routers.search}',
      name: Routers.search,
      pageBuilder: (context, state) =>
          pageAnimation(page: const SearchView()),
    ),
     GoRoute(
      path: '/${Routers.settings}',
      name: Routers.settings,
      pageBuilder: (context, state) =>
          pageAnimation(page: const SettingsView()),
    ),
     GoRoute(
      path: '/${Routers.addmessges}',
      name: Routers.addmessges,
      pageBuilder: (context, state) =>
          pageAnimation(page: const AddMessges()),
    )
  ]);
}
