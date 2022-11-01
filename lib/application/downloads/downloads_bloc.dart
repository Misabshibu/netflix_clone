import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netfix_clone/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/failure.dart/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.inital()) {
    on<DownloadsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, downloadFailorSucces: none()));

      final Either<MainFailure, List<Downloads>> downladsOption =
          await _downloadsRepo.getDownloadsImages();
      log(downladsOption.toString());

      emit(downladsOption.fold(
          (failure) => state.copyWith(
              isLoading: false, downloadFailorSucces: some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadFailorSucces: some(Right(success)))));
    });
  }
}
