import 'package:hamo_dashboard/models/category_response.dart';
import 'package:hamo_dashboard/models/booker_response.dart';
import 'package:hamo_dashboard/models/services_response.dart';
import 'package:latlong2/latlong.dart';

class ServiceRequestBody {
  final String serviceName;
  final String cover;
  final List<String> images;
  final String description;
  final String servicePresenter;
  final int servicePrice;
  final LatLng location;
  final CategoryResponse category;
  final List<ServiceRate> rating;
  final List<BookerResponse> bookers;

  ServiceRequestBody({
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

  Map<String, dynamic> toJson() => {
    'serviceName': serviceName,
    'cover': cover,
    'images': images,
    'description': description,
    'servicePresenter': servicePresenter,
    'servicePrice': servicePrice,
    'location': location,
    'category': category,
    'rating': rating,
    'bookers': bookers,
  };
}
