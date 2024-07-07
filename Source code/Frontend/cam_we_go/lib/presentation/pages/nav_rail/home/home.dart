import 'package:cam_we_go/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions.dart';
import '../../../widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  final double modalBottomSheetHeight = 20.h;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, modalBottomSheetHeight * -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  bool isExtended = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const Placeholder(),
          Container(
            height: 3.h,
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
                    const BorderRadius.vertical(top: Radius.circular(20))),
          ),
        ],
      ),
      floatingActionButton: _buildFABs(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _fabsWithSlideTransition(Widget fab) {
    return SlideTransition(
      position: _offsetAnimation,
      child: fab,
    );
  }

  Widget _buildFABs() {
    return _fabsWithSlideTransition(Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSecondFAB(),
        SizedBox(height: 1.h),
        _buildFirstFAB(),
      ],
    ));
  }

  FloatingActionButton _buildFirstFAB() {
    return FloatingActionButton.extended(
      heroTag: 'btn1',
      onPressed: _onPressed,
      shape: const StadiumBorder(),
      isExtended: isExtended,
      label: const Text('Location'),
      icon: const Icon(Icons.my_location_sharp, applyTextScaling: true),
    );
  }

  FloatingActionButton _buildSecondFAB() {
    return FloatingActionButton.extended(
      heroTag: 'btn2',
      onPressed: () => _showBottomSheet(context, modalBottomSheetHeight),
      shape: const StadiumBorder(),
      icon: const Icon(Icons.search_sharp, applyTextScaling: true),
      label: const Text('Search'),
      isExtended: isExtended,
    );
  }

  void _onPressed() {
    debugPrint('Pressed');
  }

  void _showBottomSheet(BuildContext context, double height) {
    GlobalKey<FormState> _formKey = GlobalKey(debugLabel: 'navigationForm');
    _controller.forward();
    setState(() => isExtended = false);
    String? fromDestination = 'UB Junction';
    String? toDestination;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
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
                      key: _formKey,
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
                                  readOnly: true,
                                  type: InputType.text,
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
                                onTap: () {},
                                context: context,
                                label: 'Route Info',
                                icon: const Icon(Icons.info_outline),
                                gap: Gap.narrow,
                                foregroundColor: Colors.white,
                              ),
                              Button.icon(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
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
        );
      },
    ).whenComplete(() => _controller.reverse());
  }
}
