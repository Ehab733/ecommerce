import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data.freezed.dart';
part 'meta_data.g.dart';

@freezed
abstract class MetaData with _$MetaData {
  const factory MetaData({
    required int currentPage,
    required int numberOfPages,
    required int limit,
    required int? nextPage,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}
