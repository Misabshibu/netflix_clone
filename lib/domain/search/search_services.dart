import 'package:dartz/dartz.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:netfix_clone/domain/search/model/search_respo/search_respo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRespo>> searchMovies(
      {required String movieQuery});
}
