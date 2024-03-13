//GetIt is used for dependency injection
//this file contains all the necessary registrations

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../features/trivia quiz/data/data source/quiz_data_source.dart';
import '../features/trivia quiz/data/data source/trivia api/trivia_api_data_source.dart';

import '../features/onboading/presentation/view models/onbaording_vm.dart';
import '../features/base/base_vm.dart';
import '../features/trivia quiz/data/repository/quiz_repository_impl.dart';
import '../features/trivia quiz/domain/repository/quiz_repository.dart';
import '../features/trivia quiz/presentation/view models/quiz_view_model.dart';

final getIt = GetIt.I;

void setUpLocator() {
  _setupDio();
  _registerRepositories();
  _registerViewModel();
}

//function to setup pretty dio interceptor
void _setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  });
}

//function to register repositories and data sources
void _registerRepositories() {
  //quiz repository/data source
  getIt
      .registerFactory<QuizDataSource>(() => TriviaAPIDataSource(getIt<Dio>()));
  getIt.registerFactory<QuizRepository>(
    () => QuizRepositoryImpl(getIt<QuizDataSource>()),
  );
}

//function to register view models
void _registerViewModel() {
  //View Model
  getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
  getIt.registerFactory<OnboardingVM>(() => OnboardingVM());
  getIt.registerFactory<QuizViewModel>(() => QuizViewModel());
}
