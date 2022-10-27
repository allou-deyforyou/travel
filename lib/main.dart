import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'screen/_screen.dart';

void main() async {
  await runAssets();
  await runService();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      routes: [
        GoRoute(
          path: HomeScreen.path,
          name: HomeScreen.name,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: CustomKeepAlive(
                child: HomeScreen(),
              ),
            );
          },
          routes: [
            GoRoute(
              path: HomeLocationSearchScreen.path,
              name: HomeLocationSearchScreen.name,
              pageBuilder: (context, state) {
                return const CupertinoPage(
                  fullscreenDialog: true,
                  child: CustomKeepAlive(
                    child: HomeLocationSearchScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Themes.theme,
      themeMode: ThemeMode.light,
      darkTheme: Themes.darkTheme,
      color: Themes.primaryColor,
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      scrollBehavior: const CustomScrollBehavior(),
      supportedLocales: CustomBuildContext.supportedLocales,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      localizationsDelegates: CustomBuildContext.localizationsDelegates,
    );
  }
}
