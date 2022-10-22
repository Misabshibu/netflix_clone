import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netfix_clone/domain/core/api_end_points.dart';
import 'package:netfix_clone/domain/search/model/search_respo/search_respo.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netfix_clone/domain/search/search_services.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchRespo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final results = SearchRespo.fromJson(response.data);
        return Right(results);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
