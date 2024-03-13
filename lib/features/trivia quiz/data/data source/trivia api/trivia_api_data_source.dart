import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/quiz_question_model.dart';

import '../../../../../core/network/error_handler.dart';
import '../../../../../core/network/network_config.dart';
import '../../../../../core/network/url_path.dart';
import '../quiz_data_source.dart';

final getIt = GetIt.I;

class TriviaAPIDataSource implements QuizDataSource {
  final Dio dio;

  TriviaAPIDataSource(this.dio);

  @override
  Future<List<QuizQuestionModel>> getTriviaQuestions() async {
    try {
      // var response = await dio.get(
      //   "${Config.baseUrl}${UrlPath.triviaQuestions}",
      // );
      final String response =
          await rootBundle.loadString('assets/questions.json');

      // log(response.data);
      final List questions = jsonDecode(response);
      final questionModel = questions
          .map((question) => QuizQuestionModel.fromJson(question))
          .toList();
      return questionModel;
    } on DioException catch (error) {
      handleError(error);
      log(error.toString());
      rethrow;
    }
  }
}
