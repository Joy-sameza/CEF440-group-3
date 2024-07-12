import 'dart:async';

import 'package:cam_we_go/domain/usecases/get_view_location/get_view_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/extensions.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/enum.dart';
import '../widgets/widgets.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  final Completer<GoogleMapController> _mapsController =
      Completer<GoogleMapController>();

  final double modalBottomSheetHeight = 18.h;
  final Set<Marker> _markers = {};
  final LatLng inBuea = const LatLng(4.151007, 9.290702);
  bool isExtended = false;
  Position? currentLocation, lastKnownPosition;
  final double zoomLevel = 15.0;

  @override
  void initState() {
    super.initState();
    const GetViewLocation().currentLocation.then((value) {
      setState(() {
        currentLocation = value;

        if (currentLocation != null) {
          debugPrint(currentLocation.toString());
          _markers.add(Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(
              currentLocation!.latitude,
              currentLocation!.longitude,
            ),
            infoWindow: const InfoWindow(
              title: 'Current Location',
              snippet: 'You are here',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ));
        } else {
          const GetViewLocation().getLastKnownPosition.then((value) {
            lastKnownPosition = value;
            if (lastKnownPosition != null) {
              _markers.add(Marker(
                markerId: const MarkerId('lastKnownPosition'),
                position: LatLng(
                  lastKnownPosition!.latitude,
                  lastKnownPosition!.longitude,
                ),
                infoWindow: const InfoWindow(
                  title: 'Last Known Location',
                  snippet: 'You were here',
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed,
                ),
              ));
            }
          });
        }
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapsController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        buildingsEnabled: false,
        markers: _markers,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            inBuea.latitude,
            inBuea.longitude,
          ),
          zoom: zoomLevel,
        ),
      ),
      floatingActionButton: _buildFABs(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildFABs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFirstFAB(),
        SizedBox(height: 1.h),
        _buildSecondFAB(),
      ],
    );
  }

  FloatingActionButton _buildFirstFAB() {
    return FloatingActionButton.small(
      heroTag: 'btn1',
      onPressed: () {
        if (currentLocation == null) {
          setState(() {
            const GetViewLocation().currentLocation.then((value) {
              currentLocation = value;
            });
          });
          viewMyLocation();
          return;
        }
        viewMyLocation();
      },
      shape: const CircleBorder(),
      child: const Icon(Icons.my_location_sharp, applyTextScaling: true),
    );
  }

  void viewMyLocation() {
    _mapsController.future.then((controller) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentLocation!.latitude,
            currentLocation!.longitude,
          ),
          zoom: zoomLevel,
        ),
      ));
    });
  }

  FloatingActionButton _buildSecondFAB() {
    return FloatingActionButton.extended(
      heroTag: 'btn2',
      onPressed: () => _showBottomSheet(context, modalBottomSheetHeight),
      shape: const StadiumBorder(),
      icon: const Icon(Icons.search_sharp, applyTextScaling: true),
      label: const Text('Search Route', style: TextStyle(fontSize: 12)),
      isExtended: true,
    );
  }

  void _showBottomSheet(BuildContext context, double height) {
    GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'navigationForm');
    setState(() => isExtended = false);
    String? fromDestination = 'UB Junction';
    String? toDestination;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => buildBottomSheetContent(
        height,
        context,
        formKey,
        fromDestination,
        toDestination,
      ),
    );
  }

  Widget buildBottomSheetContent(
      double height,
      BuildContext context,
      GlobalKey<FormState> formKey,
      String fromDestination,
      String? toDestination) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(5),
                    right: Radius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 0.5.h),
              Column(
                children: [
                  Text(
                    'Plan Route',
                    style: context.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppIcons.buildIcon(Icons.my_location_outlined),
                            const SizedBox(width: 6),
                            Flexible(
                              child: InputField.text(
                                context: context,
                                label: 'From',
                                hintText: '',
                                type: InputType.text,
                                onSaved: (value) {
                                  toDestination = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter destination';
                                  }
                                  return null;
                                },
                                initialValue: fromDestination,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: AppIcons.buildSVG(AppIcons.pageControl),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppIcons.buildSVG(AppIcons.distance),
                            const SizedBox(width: 6),
                            Flexible(
                              child: InputField.text(
                                context: context,
                                label: 'To',
                                hintText: '',
                                type: InputType.text,
                                onSaved: (value) {
                                  toDestination = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter destination';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button.icon(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context.push(
                                    '/home/more_route_details',
                                    extra: <String, String>{
                                      'from': fromDestination!,
                                      'to': toDestination!,
                                    },
                                  );
                                }
                                return;
                              },
                              context: context,
                              label: 'Route Info',
                              icon: const Icon(Icons.info_outline),
                              gap: Gap.narrow,
                              foregroundColor: Colors.white,
                            ),
                            Button.icon(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context.push(
                                    '/home/navigation_page',
                                    extra: <String, String>{
                                      'from': fromDestination!,
                                      'to': toDestination!,
                                    },
                                  );
                                }
                              },
                              context: context,
                              label: 'Navigate',
                              icon: const Icon(Icons.navigation_outlined),
                              gap: Gap.narrow,
                              foregroundColor: Colors.white,
                            ),
                          ],
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
    );
  }
}
