import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions.dart';
import '../../../../widgets/maps.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> destinations =
        GoRouterState.of(context).extra as Map<String, String>;

    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.volume_off_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Maps(
              from: destinations['from']!,
              to: destinations['to']!,
            ),
            Container(
              height: 5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.primaryColor,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, -4),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 0.5.h),
                  Container(
                    width: 10.w,
                    height: 0.5.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(5),
                        right: Radius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.cancel_outlined,
                              color: Colors.white),
                          onPressed: () => context.pop(),
                          iconSize: 40,
                        ),
                        GestureDetector(
                          onTap: () => context
                              .push('/search_view_road_signs/road_sign_info'),
                          child: Row(
                            children: [
                              Container(
                                height: 5.w,
                                width: 5.w,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Stop Sign Ahead',
                                    style: context.textTheme.bodyLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    'Distance: 200 m',
                                    style: context.textTheme.bodyLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.alt_route,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              context.push('/home/more_route_details'),
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
