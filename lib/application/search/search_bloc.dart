import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfix_clone/domain/core/failure.dart/main_failure.dart';
import 'package:netfix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netfix_clone/domain/downloads/models/downloads.dart';
import 'package:netfix_clone/domain/search/model/search_respo/search_respo.dart';
import 'package:netfix_clone/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //idle State*************
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
              searchResultData: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false),
        );
        return;
      }
      emit(
        const SearchState(
            searchResultData: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );
      // get trending
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultData: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultData: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(_state);
    });

    //Search event **********
    on<SearchMovie>((event, emit) async {
      //call search movie
      log('Searching for ${event.movieQuery}');
      emit(const SearchState(
          searchResultData: [], idleList: [], isLoading: true, isError: false));

      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);

      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultData: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (SearchRespo r) {
          return SearchState(
              searchResultData: r.results,
              idleList: [],
              isLoading: false,
              isError: false);
        },
      );

      //show to ui

      emit(_state);
      // TODO: implement event handler
    });
  }
}
