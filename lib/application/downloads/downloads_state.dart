part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState(
      {required bool isLoading,
      required List<Downloads>? downloads,
      required Option<Either<MainFailure, List<Downloads>>>
          downloadFailorSucces}) = _DownloadsState;

  factory DownloadsState.inital() {
    return DownloadsState(
        isLoading: false, downloadFailorSucces: none(), downloads: []);
  }
}
