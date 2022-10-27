import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '_widget.dart';

class PostItemSharedWidget extends StatelessWidget {
  const PostItemSharedWidget({
    Key? key,
    required this.description,
    required this.maxFontSize,
    this.titleMaxLines = 4,
    required this.source,
    required this.logo,
    this.overflow,
    this.title,
    this.date,
  }) : super(key: key);

  final String description;
  final double maxFontSize;
  final int titleMaxLines;
  final String source;
  final String logo;

  final TextOverflow? overflow;
  final DateTime? date;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const padding = EdgeInsets.symmetric(horizontal: 12.0);
    // final locale = window.locale.languageCode;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: date != null,
          child: Builder(
            builder: (context) {
              return const ListTile(
                contentPadding: padding,
                visualDensity: VisualDensity(
                  vertical: VisualDensity.minimumDensity,
                  horizontal: VisualDensity.minimumDensity,
                ),
                subtitle: Text("Il y a 5 minutes"
                    // timeago.format(date!, locale: locale).capitalize(),
                    ),
              );
            },
          ),
        ),
        Visibility(
          visible: title != null,
          child: Builder(
            builder: (context) {
              return Padding(
                padding: padding,
                child: AutoSizeText(
                  title!,
                  overflow: overflow,
                  maxLines: titleMaxLines,
                  maxFontSize: maxFontSize,
                  minFontSize: theme.textTheme.headline6!.fontSize!,
                  style: theme.textTheme.headline4?.copyWith(
                    fontFamily: FontFamily.sFProRounded,
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        ListTile(
          contentPadding: padding,
          leading: CircleAvatarSharedWidget(avatar: logo),
          title: Text(
            '$source ( $description )',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: theme.textTheme.headline1?.color),
          ),
        ),
      ],
    );
  }
}

class CircleAvatarSharedWidget extends StatelessWidget {
  const CircleAvatarSharedWidget({
    Key? key,
    required this.avatar,
  }) : super(key: key);
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipOval(
          child: Image.network(avatar),
        ),
      ),
    );
  }
}
