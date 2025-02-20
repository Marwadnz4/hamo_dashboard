import 'package:enum_to_string/enum_to_string.dart';
import 'package:hamo_dashboard/models/address_model.dart';

class BookerResponse {
  final String userUid;
  final String userName;
  final AddressModel location;
  final BookerStatus serviceStatus;
  final DateTime beingDate;
  final DateTime endDate;

  BookerResponse({
    required this.userUid,
    required this.userName,
    required this.location,
    required this.serviceStatus,
    required this.beingDate,
    required this.endDate,
  });

  factory BookerResponse.fromJson(Map<String, dynamic> json) =>
      BookerResponse(
        userUid: json['userUid'] as String,
        userName: json['userName'] as String,
        location: AddressModel.fromJson(json['location']),
        serviceStatus:
            EnumToString.fromString(
              BookerStatus.values,
              json['serviceStatus'] as String,
            )!,
        beingDate: json['beingDate'].toDate(),
        endDate: json['endDate'].toDate(),
      );
}

enum BookerStatus { upcoming, completed, canceled }
