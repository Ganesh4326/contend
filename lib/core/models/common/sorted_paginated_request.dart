// import 'package:json_annotation/json_annotation.dart';
//
// import '/app/core/models/common/paginated_request.dart';
//
// part 'sorted_paginated_request.g.dart';
//
// @JsonSerializable(fieldRename: FieldRename.snake)
// class SortedPaginatedRequest extends PaginatedRequest {
//   String? fieldName;
//   bool? descending;
//
//   SortedPaginatedRequest(
//       {this.fieldName, this.descending, super.lastDocumentId, super.count});
//
//   factory SortedPaginatedRequest.fromJson(Map<String, dynamic> json) =>
//       _$SortedPaginatedRequestFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SortedPaginatedRequestToJson(this);
// }
