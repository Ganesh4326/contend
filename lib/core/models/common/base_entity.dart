// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// // import '/app/core/models/common/converters/date_time_to_iso_converter.dart';
//
// part 'base_entity.g.dart';
//
// @JsonSerializable(fieldRename: FieldRename.snake)
// class BaseEntity {
//   factory BaseEntity.fromJson(Map<String, dynamic> json) =>
//       _$BaseEntityFromJson(json);
//
//   Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
//
//   String? id;
//   @DateTimeToIsoConverter()
//   DateTime? createdTime;
//   @DateTimeToIsoConverter()
//   DateTime? lastUpdatedTime;
//
//   BaseEntity({this.id,DateTime? createdTime, DateTime? lastUpdatedTime}) {
//     this.createdTime = createdTime ?? DateTime.now();
//     this.lastUpdatedTime = lastUpdatedTime ?? DateTime.now();
//   }
//
//   BaseEntity copyWith({
//     String? id,
//     DateTime? createdTime,
//     DateTime? lastUpdatedTime,
//   }) {
//     return BaseEntity(
//       id:id??this.id,
//       createdTime: createdTime ?? this.createdTime,
//       lastUpdatedTime: lastUpdatedTime ?? this.lastUpdatedTime,
//     );
//   }
// }
