import 'package:cam_we_go/core/extensions.dart';
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
                                        Text(element['text']! as String,
                                            style: context.textTheme.bodyLarge),
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
                                        Text(element['text']! as String,
                                            style: context.textTheme.bodyLarge),
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
                                  ].map(
                                    (element) {
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
                                                Text(element['text']! as String,
                                                    style:
                                                        context.textTheme.bodyLarge),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            
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
