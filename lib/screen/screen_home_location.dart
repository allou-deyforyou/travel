import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '_screen.dart';

class HomeLocationScreen extends StatefulWidget {
  const HomeLocationScreen({super.key});

  static const path = 'location';
  static const name = 'location';

  @override
  State<HomeLocationScreen> createState() => _HomeLocationScreenState();
}

class _HomeLocationScreenState extends State<HomeLocationScreen> {
  void _goToSearch() {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return const HomeLocationSearchScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(color: CupertinoColors.systemFill),
    );
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const HomeLocationAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton.small(
        shape: shape,
        elevation: 0.8,
        onPressed: () {},
        backgroundColor: context.theme.colorScheme.surface,
        child: const Icon(Icons.my_location_rounded),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60.0, left: 16.0, right: 16.0),
        child: CustomFloatingButton(
          shape: shape,
          elevation: 8.0,
          onPressed: _goToSearch,
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: HomeSearchTextField(
              placeholder: "Hi, Où aller ?",
              enabled: false,
            ),
          ),
        ),
      ),
      body: const HomeLocationMap(),
    );
  }
}
