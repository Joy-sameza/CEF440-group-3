import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/auth/login.dart';
import '../presentation/pages/auth/register.dart';
import '../presentation/pages/auth/reset_password.dart';
import '../presentation/pages/nav_rail/home/sub/navigation_page.dart';
import '../presentation/pages/onboarding_page.dart';
import '../presentation/pages/nav_rail/home/home.dart';
import '../presentation/pages/nav_rail/home/sub/more_route_details.dart';
import '../presentation/pages/nav_rail/search_view/search_view_road_signs.dart';
import '../presentation/pages/nav_rail/settings/settings.dart';
import '../presentation/pages/nav_rail/settings/sub/customize_notif.dart';
import '../presentation/pages/nav_rail/settings/sub/edit_profile.dart';
import '../presentation/pages/nav_rail/settings/sub/my_preferences.dart';
import '../presentation/pages/nav_rail/settings/sub/post_crash_care.dart';
import '../presentation/pages/nav_rail/settings/sub/report.dart';
import '../presentation/pages/nav_rail/search_view/sub/road_sign_info.dart';
import '../presentation/pages/nav_rail/search_view/sub/road_state_info.dart';
import '../presentation/widgets/scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'navBar');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) =>
          customFadeInTransition(state, const OnboardingPage()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          customSlideInTransition(state, const Login()),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) =>
          customSlideInTransition(state, const Register()),
    ),
    GoRoute(
      path: '/reset_password',
      pageBuilder: (context, state) =>
          customSlideInTransition(state, const ResetPassword()),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              customFadeInTransition(state, const Home()),
          routes: [
            GoRoute(
                path: 'more_route_details',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) =>
                    customSlideInTransition(state, const MoreRouteDetails())),
            GoRoute(
              path: 'navigation_page',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customFadeInTransition(state, const NavigationPage()),
            ),
          ],
        ),
        GoRoute(
          path: '/search_view_road_signs',
          pageBuilder: (context, state) =>
              customFadeInTransition(state, const SearchViewRoadSigns()),
          routes: [
            GoRoute(
              path: 'road_sign_info',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) {
                final Map<String, String> pathParams = state.uri.queryParameters;
                return customSlideInTransition(state, RoadSignInfo(roadSignId: pathParams['id']!));
              },
            ),
            GoRoute(
              path: 'road_state_info',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customSlideInTransition(state, const RoadStateInfo()),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) =>
              customFadeInTransition(state, const Settings()),
          routes: [
            GoRoute(
              path: 'edit_profile',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customSlideInTransition(state, const EditProfile()),
            ),
            GoRoute(
              path: 'my_preferences',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customSlideInTransition(state, const MyPreferences()),
            ),
            GoRoute(
              path: 'post_crash_care',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customSlideInTransition(state, const PostCrashCare()),
            ),
            GoRoute(
              path: 'customize_notif',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customSlideInTransition(state, const CustomizeNotif()),
            ),
            GoRoute(
              path: 'report',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  customSlideInTransition(state, const Report()),
            ),
          ],
        ),
      ],
    ),
  ],
);

CustomTransitionPage customSlideInTransition(
    GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.75, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

CustomTransitionPage customFadeInTransition(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeOut;
      final offsetAnimation = CurveTween(curve: curve).animate(animation);
      return FadeTransition(
        opacity: offsetAnimation,
        child: child,
      );
    },
  );
}
