import 'package:dartz/dartz.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:netfix_clone/domain/hot_and_new/model/hot_and_new.dart';

abstract class HotAndNewServices {
  Future<Either<MainFailure, HotAndNew>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNew>> getHotAndNewData();
}
