import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constant.dart';
import 'package:cam_we_go/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/enum.dart';

class MoreRouteDetails extends StatelessWidget {
  const MoreRouteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> destinations =
        GoRouterState.of(context).extra as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Route Details',
          style: context.textTheme.headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconWithLabel(
                    icon: Icons.location_on_outlined,
                    label: 'Destination',
                  ),
                  SizedBox(height: 0.5.h),
                  OutinedBorderedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            destinations['to']!,
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const IconWithLabel(
                        icon: Icons.cloud_circle_outlined,
                        label: 'Weather Info',
                      ),
                      SizedBox(height: 0.5.h),
                      OutinedBorderedContainer(
                        child: Column(
                          children: [
                            ...[
                              {
                                'icon': Icons.air,
                                'label': 'Wind Speed : ',
                                'text': '8.7 Km/h',
                              },
                              {
                                'icon': Icons.foggy,
                                'label': 'Fog Level : ',
                                'text': 'Very High',
                              },
                              {
                                'icon': Icons.cloudy_snowing,
                                'label': 'Rain : ',
                                'text': 'Thunder Showers',
                              },
                            ].map((element) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        IconWithLabel(
                                          icon: element['icon']! as IconData,
                                          label: element['label']! as String,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          element['text']! as String,
                                          style: context.textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const IconWithLabel(
                        icon: Icons.car_repair_outlined,
                        label: 'Road State Info',
                      ),
                      SizedBox(height: 0.5.h),
                      OutinedBorderedContainer(
                        child: Column(
                          children: [
                            ...[
                              {
                                'icon': Icons.air,
                                'label': 'Traffic Congestion : ',
                                'text': 'High', // params
                              },
                              {
                                'icon': Icons.foggy,
                                'label': 'Road Closure : ',
                                'text': 'None', // params
                              },
                              {
                                'icon': Icons.car_crash_outlined,
                                'label': 'Incidents : ',
                                'text': 'None', // params
                              },
                            ].map((element) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        IconWithLabel(
                                          icon: element['icon']! as IconData,
                                          label: element['label']! as String,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          element['text']! as String,
                                          style: context.textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const IconWithLabel(
                        icon: Icons.traffic_outlined,
                        label: 'Road Sign Info',
                      ),
                      SizedBox(height: 0.5.h),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ...[
                              {
                                'id': 1.toString(),
                                'img': Images.logo,
                                'name': 'Stop sign',
                                'action':
                                    'Slow down and look out for other temporary road traffic signs',
                              },
                              {
                                'id': 1.toString(),
                                'img': Images.logo,
                                'name': 'Stop sign',
                                'action':
                                    'Slow down and look out for other temporary road traffic signs',
                              },
                              {
                                'id': 1.toString(),
                                'img': Images.logo,
                                'name': 'Stop sign',
                                'action':
                                    'Slow down and look out for other temporary road traffic signs',
                              },
                              {
                                'id': 1.toString(),
                                'img': Images.logo,
                                'name': 'Stop sign',
                                'action':
                                    'Slow down and look out for other temporary road traffic signs',
                              },
                            ].map((element) {
                              return Column(
                                children: [
                                  SizedBox(height: 1.h),
                                  GestureDetector(
                                    onTap: () => context.push(
                                        '/search_view_road_signs/road_sign_info?id=${element['id']!}'),
                                    child: OutinedBorderedContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0)
                                            .copyWith(bottom: 8.0),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Image.asset(
                                                element['img']!,
                                                width: 8.w,
                                                height: 8.w,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            SizedBox(width: 0.5.h),
                                            Flexible(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Name : ',
                                                        style: context.textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        element['name']!,
                                                        style: context.textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Action : ',
                                                        style: context.textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          element['action']!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: false,
                                                          style: context
                                                              .textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'read more',
                                                    style: context
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                      color:
                                                          context.primaryColor,
                                                      decorationColor:
                                                          context.primaryColor,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.5.h,
            child: Button.icon(
              onTap: () {},
              context: context,
              label: 'Alternative route',
              icon: const Icon(Icons.alt_route_outlined),
              gap: Gap.narrow,
            ),
          ),
        ],
      ),
    );
  }
}
