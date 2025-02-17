import 'package:hamo_dashboard/models/booker_response.dart';

class UpdateServiceStatusRequestBody {
  final String serviceDocId;
  final List<BookerResponse> bookers;

  UpdateServiceStatusRequestBody({
    required this.serviceDocId,
    required this.bookers,
  });

  Map<String, dynamic> toJson() => {'bookers': bookers};
}
