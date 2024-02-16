// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import '../../../logger/log.dart';
//
//
// class DateTimeToIsoConverter implements JsonConverter<DateTime?, String> {
//   const DateTimeToIsoConverter();
//
//   @override
//   DateTime? fromJson(String json) {
//     try {
//       return AppDateTimeUtils.parseDateTimeString(json);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   @override
//   String toJson(DateTime? object) {
//     if (object != null) {
//       return AppDateTimeUtils.formatDateToSerializableString(object);
//     }
//     return "";
//   }
// }
//
// class DateTimeToTimestampConverter
//     implements JsonConverter<DateTime?, Timestamp?> {
//   const DateTimeToTimestampConverter();
//
//   @override
//   DateTime? fromJson(Timestamp? value) {
//     if (value != null) {
//       return value.toDate();
//     }
//     return null;
//   }
//
//   @override
//   Timestamp? toJson(DateTime? value) =>
//       value != null ? Timestamp.fromDate(value) : null;
// }
