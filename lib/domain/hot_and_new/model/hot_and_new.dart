import 'package:json_annotation/json_annotation.dart';

part 'hot_and_new.g.dart';

@JsonSerializable()
class HotAndNew {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<HotAndNewData> results;

  HotAndNew({this.page, this.results = const []});

  factory HotAndNew.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewToJson(this);
}

@JsonSerializable()
class HotAndNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;
  bool? video;

  HotAndNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
  });

  factory HotAndNewData.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
