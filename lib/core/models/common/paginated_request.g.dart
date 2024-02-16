// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedRequest _$PaginatedRequestFromJson(Map<String, dynamic> json) =>
    PaginatedRequest(
      lastDocumentId: json['lastDocumentId'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$PaginatedRequestToJson(PaginatedRequest instance) =>
    <String, dynamic>{
      'lastDocumentId': instance.lastDocumentId,
      'count': instance.count,
    };
