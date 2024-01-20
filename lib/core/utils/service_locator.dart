
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kotoby_app/core/network/api_service.dart';
import 'package:kotoby_app/features/home/data/repo/home_repo_imp.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(apiService: getIt.get<ApiService>()));
}