import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    bool isExtended = false;
    return Scaffold(
      body: const Center(child: Text('Home', style: TextStyle(fontSize: 20))),
      floatingActionButton: _buildFABs(isExtended),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildFABs(bool isExtended) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSecondFAB(isExtended),
        const SizedBox(height: 10),
        _buildFirstFAB(isExtended),
      ],
    );
  }

  FloatingActionButton _buildFirstFAB(bool isExtended) {
    return FloatingActionButton.extended(
      heroTag: 'btn1',
      onPressed: _onPressed,
      shape: const StadiumBorder(),
      isExtended: isExtended,
      label: const Text('Location'),
      icon: const Icon(Icons.my_location_sharp, applyTextScaling: true),
    );
  }

  FloatingActionButton _buildSecondFAB(bool isExtended) {
    return FloatingActionButton.extended(
      heroTag: 'btn2',
      onPressed: _onPressed,
      shape: const StadiumBorder(),
      icon: const Icon(Icons.search_sharp, applyTextScaling: true),
      label: const Text('Search'),
      isExtended: isExtended,
    );
  }

  void _onPressed() {
    debugPrint('Pressed');
  }

  void _buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close BottomSheet'),
            ),
          ),
        );
      },
    );
  }
}
