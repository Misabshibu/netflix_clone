import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:netfix_clone/domain/hot_and_new/hot_and_new_services.dart';
import 'package:netfix_clone/domain/hot_and_new/model/hot_and_new.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewServices _hotAndNewServices;
  HotAndNewBloc(this._hotAndNewServices) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadDataInComingsopm>((event, emit) async {
//send loading to ui

      emit(const HotAndNewState(
          comingSoonList: [],
          everyoneWatchingList: [],
          isLoading: true,
          hasError: false));

      //get data from remote

      final _result = await _hotAndNewServices.getHotAndNewMovieData();
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyoneWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNew resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyoneWatchingList: state.everyoneWatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
    //get hot and new t//get hot and new movie data data

    on<LoadDataInEveryoneWatching>((event, emit) async {
      // send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyoneWatchingList: [],
          isLoading: true,
          hasError: false));

      //get data from remote

      final _result = await _hotAndNewServices.getHotAndNewData();
      log(_result.toString());
      //data to state
      final _newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyoneWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNew resp) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });

      emit(_newState);
    });
  }
}
