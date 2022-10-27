import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_widget.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      color: context.theme.colorScheme.surface,
      child: FractionallySizedBox(
        widthFactor: 0.15,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Divider(
            color: CupertinoColors.systemFill,
            thickness: 5.0,
            height: 5.0,
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.color,
    this.endIndent,
    this.height,
    this.indent,
    this.thickness,
  }) : super(key: key);

  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Divider(
        color: color,
        endIndent: endIndent,
        height: height ?? 1.0,
        indent: indent,
        thickness: thickness,
      ),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    this.color,
    this.minSize = 36.0,
    required this.child,
    this.elevation = 12.0,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double minSize;
  final double elevation;
  final ShapeBorder shape;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      decoration: ShapeDecoration(
        shape: shape,
        color: theme.backgroundColor,
        shadows: [
          BoxShadow(
            blurRadius: elevation,
            spreadRadius: -elevation,
          )
        ],
      ),
      child: CustomButton(
        color: color ?? theme.colorScheme.onSurface,
        onPressed: onPressed,
        minSize: minSize,
        padding: padding,
        child: child,
      ),
    );
  }
}
