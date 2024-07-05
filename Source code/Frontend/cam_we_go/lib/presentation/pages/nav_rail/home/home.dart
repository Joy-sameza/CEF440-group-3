import 'package:cam_we_go/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions.dart';

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
    _controller.forward();
    setState(() => isExtended = false);
    print(2.h);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController fromController = TextEditingController();
        final TextEditingController toController = TextEditingController();
        return SizedBox(
            height: height,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
              child: Column(
                children: [
                  Container(
                    width: 15.w,
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
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Plan Route',
                          style: context.textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2.h),
                        Form(
                            child: Row(
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.my_location_outlined),
                                SizedBox(height: 0.5.h),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child:
                                      AppIcons.buildSVG(AppIcons.pageControl),
                                ),
                                SizedBox(height: 0.5.h),
                                AppIcons.buildSVG(AppIcons.distance),
                              ],
                            ),
                            const SizedBox(width: 6),
                            Column(

                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    ).whenComplete(() => _controller.reverse());
  }
}
