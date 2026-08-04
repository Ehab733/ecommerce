// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaData _$MetaDataFromJson(Map<String, dynamic> json) => _MetaData(
  currentPage: (json['currentPage'] as num).toInt(),
  numberOfPages: (json['numberOfPages'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  nextPage: (json['nextPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaDataToJson(_MetaData instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
  'nextPage': instance.nextPage,
};
