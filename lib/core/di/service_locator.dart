import 'package:dio/dio.dart';
import 'package:flutter_bloc_movie_app_example/core/route/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setUp() {
  setUpCommons();
}

void setUpCommons() {
  getIt
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerSingleton<Logger>(Logger())
    ..registerSingleton<Dio>(Dio());
}
