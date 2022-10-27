import 'package:flutter/material.dart';

import '_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.currentIndex = 3,
  }) : super(key: key);

  final int currentIndex;

  static const path = '/';
  static const name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<ScrollController> _scrollControllers;
  late final ValueNotifier<int> _indexController;
  late final PageController _pageController;
  late final List<Widget> _children;

  void _animateToPage(ScrollController controller) {
    if (controller.hasClients) {
      const curve = Curves.easeInOut;
      const duration = Duration(seconds: 1);
      controller.animateTo(0.0, curve: curve, duration: duration);
    }
  }

  void _onPageChanged(int value) {
    if (value == 2) {
    } else if (_indexController.value != value) {
      _pageController.jumpToPage(value);
      _indexController.value = value;
    } else {
      _animateToPage(_scrollControllers[value]);
    }
  }

  @override
  void initState() {
    super.initState();
    _indexController = ValueNotifier(widget.currentIndex);
    _pageController = PageController(initialPage: _indexController.value);
    _children = const [
      CustomKeepAlive(
        key: ValueKey(HomeRestaurantScreen.name),
        child: HomeRestaurantScreen(),
      ),
      CustomKeepAlive(
        key: ValueKey(HomeNotificationScreen.name),
        child: HomeNotificationScreen(),
      ),
      SizedBox.shrink(),
      CustomKeepAlive(
        key: ValueKey(HomeLocationScreen.name),
        child: HomeLocationScreen(),
      ),
      CustomKeepAlive(
        key: ValueKey(HomeAccountScreen.name),
        child: HomeAccountScreen(),
      ),
    ];
    _scrollControllers = List.of(_children.map((e) => ScrollController()));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _indexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _indexController,
      builder: (context, index, body) {
        return Scaffold(
          body: body,
          resizeToAvoidBottomInset: false,
          extendBody: [0, 3].contains(index),
          bottomNavigationBar: HomeBottomNavigationBar(
            onTap: _onPageChanged,
            currentIndex: index,
          ),
        );
      },
      child: PageView.builder(
        controller: _pageController,
        itemCount: _children.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return PrimaryScrollController(
            controller: _scrollControllers[index],
            child: _children[index],
          );
        },
      ),
    );
  }
}
