import 'package:auto_route/auto_route.dart';
import 'package:flutter_auth/controllers/auth_service.dart';
import 'package:flutter_auth/features/auth/login_screen.dart';
import 'package:flutter_auth/features/home/home.dart';
import 'package:flutter_auth/features/rental/rental.dart';
import 'package:flutter_auth/features/search/search.dart';
import 'package:flutter_auth/features/train/train.dart';
import 'package:flutter_auth/features/user/user.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,
        path: '/',
        guards: [AuthGuard()],
        children: [
          AutoRoute(page: RentalRoute.page, path: 'rental'),
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: TrainRoute.page, path: 'train'),
          AutoRoute(page: UserRoute.page, path: 'user'),
        ]),
    AutoRoute(
      page: LoginRoute.page,
    ),
  ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await AuthService.isLoggedIn()) {
      resolver.next(true);
    }
    router.push(const LoginRoute());
  }
}
