import 'package:hamo_dashboard/models/address_model.dart';
import 'package:hamo_dashboard/models/category_response.dart';
import 'package:hamo_dashboard/models/booker_response.dart';

class ServiceResponse {
  final String serviceDocId;
  final String serviceName;
  final String cover;
  final List<String> images;
  final String description;
  final String servicePresenter;
  final int servicePrice;
  final AddressModel location;
  final CategoryResponse category;
  final List<ServiceRate> rating;
  final List<BookerResponse> bookers;

  ServiceResponse({
    required this.serviceDocId,
    required this.serviceName,
    required this.cover,
    required this.images,
    required this.description,
    required this.servicePresenter,
    required this.servicePrice,
    required this.location,
    required this.category,
    required this.rating,
    required this.bookers,
  });

  factory ServiceResponse.fromJson(
    Map<String, dynamic> json,
  ) => ServiceResponse(
    serviceDocId: json['serviceDocId'] as String,
    serviceName: json['serviceName'] as String,
    servicePresenter: json['servicePresenter'] as String,
    cover: json['cover'] as String,
    description: json['description'] as String,
    servicePrice: (json['startingPrice'] as num).toInt(),
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    rating:
        (json['rating'] as List<dynamic>).isNotEmpty
            ? (json['rating'] as List<dynamic>)
                .map((e) => ServiceRate.fromJson(e as Map<String, dynamic>))
                .toList()
            : [],
    bookers:
        (json['bookers'] as List<dynamic>).isNotEmpty
            ? (json['bookers'] as List<dynamic>)
                .map((e) => BookerResponse.fromJson(e as Map<String, dynamic>))
                .toList()
            : [],
    category: CategoryResponse.fromJson(
      json['category'] as Map<String, dynamic>,
    ),
    location: AddressModel.fromJson(
      json['location'] as Map<String, dynamic>,
    ),
  );
}

class ServiceRate {
  final double rating;
  final String userUid;

  ServiceRate({required this.rating, required this.userUid});

  factory ServiceRate.fromJson(Map<String, dynamic> json) => ServiceRate(
    userUid: json['userUid'] as String,
    rating: (json['rating'] as num).toDouble(),
  );
}
