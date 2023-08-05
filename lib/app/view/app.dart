import 'package:flutter/material.dart';
import 'package:flutter_bloc_movie_app_example/core/di/service_locator.dart';
import 'package:flutter_bloc_movie_app_example/core/route/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = getIt<AppRouter>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(useMaterial3: true),
      routerConfig: _appRouter.router,
    );
  }
}
