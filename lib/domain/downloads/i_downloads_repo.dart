import 'package:dartz/dartz.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:netfix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
