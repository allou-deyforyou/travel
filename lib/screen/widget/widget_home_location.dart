import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:maplibre_gl/mapbox_gl.dart';

import '_widget.dart';

class HomeLocationAppBar extends DefaultAppBar {
  const HomeLocationAppBar({super.key});

  @override
  Size get preferredSize => super.preferredSize * 1.5;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      toolbarHeight: preferredSize.height,
      backgroundColor: Colors.transparent,
      title: CustomButton(
        onPressed: () {},
        child: CustomListTile(
          title: Center(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16.0,
                    spreadRadius: -30.0,
                    color: Colors.white,
                  ),
                ],
              ),
              child: Text(
                "Quartier de Akeikoi",
                style: theme.textTheme.headline6?.copyWith(
                  height: 1.0,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.activeBlue,
                  decoration: TextDecoration.underline,
                  shadows: [
                    Shadow(
                      color: theme.colorScheme.surface,
                      blurRadius: 0.8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          subtitle: const Center(
            child: Text(
              "Votre adresse",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSearchTextField extends StatefulWidget {
  const HomeSearchTextField({
    Key? key,
    this.autofocus = false,
    this.enabled = true,
    this.controller,
    this.prefixText,
    this.placeholder,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? placeholder;
  final VoidCallback? onTap;
  final Widget? prefixText;
  final bool autofocus;
  final bool enabled;

  @override
  State<HomeSearchTextField> createState() => _HomeSearchTextFieldState();
}

class _HomeSearchTextFieldState extends State<HomeSearchTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void didUpdateWidget(covariant HomeSearchTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller = widget.controller ?? TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, child) {
        Widget prefixIcon = const FittedBox(child: Icon(CupertinoIcons.search));
        if (value.text.isNotEmpty && widget.prefixText != null) {
          prefixIcon = Center(
            child: widget.prefixText,
          );
        }
        return CustomSearchTextField(
          prefixIcon: SizedBox(width: 18.0, child: prefixIcon),
          placeholder: widget.placeholder,
          controller: widget.controller,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          onTap: widget.onTap,
        );
      },
    );
  }
}

class HomeLocationMap extends StatelessWidget {
  const HomeLocationMap({
    super.key,
    this.onMapCreated,
    this.onMapLongClick,
    this.onUserLocationUpdated,
    this.onMapClick,
  });

  final OnMapClickCallback? onMapClick;
  final MapCreatedCallback? onMapCreated;
  final OnMapClickCallback? onMapLongClick;
  final OnUserLocationUpdated? onUserLocationUpdated;

  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      dragEnabled: false,
      compassEnabled: false,
      onMapClick: onMapClick,
      myLocationEnabled: true,
      onMapCreated: onMapCreated,
      onStyleLoadedCallback: () {},
      onMapLongClick: onMapLongClick,
      onUserLocationUpdated: onUserLocationUpdated,
      initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
      gestureRecognizers: {Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())},
      styleString: 'https://api.maptiler.com/maps/57a3fe25-6f58-47b5-863f-ffd1be0122eb/style.json?key=ohdDnBihXL3Yk2cDRMfO',
    );
  }
}
