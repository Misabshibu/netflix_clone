import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netfix_clone/domain/core/api_end_points.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netfix_clone/domain/hot_and_new/hot_and_new_services.dart';
import 'package:netfix_clone/domain/hot_and_new/model/hot_and_new.dart';

@LazySingleton(as: HotAndNewServices)
class HotAndNewImplements implements HotAndNewServices {
  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndNewData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.HotAndNewMovie,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final results = HotAndNew.fromJson(response.data);
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

  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.HotAndNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final results = HotAndNew.fromJson(response.data);
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
