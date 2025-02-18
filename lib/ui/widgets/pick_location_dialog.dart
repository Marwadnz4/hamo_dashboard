import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/view_models/add_service_controller.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:latlong2/latlong.dart';

class PickLocationField extends StatelessWidget {
  const PickLocationField({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showMapDialog(context);
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          Icons.location_on_outlined,
          size: 25,
          color: ColorsManager.primary,
        ),
      ),
    );
  }
}

Future<dynamic> showMapDialog(BuildContext context) {
  return showDialog(context: context, builder: (context) => MapWidget());
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final AddServiceController addServiceController = Get.find();
  final MapController mapController = MapController();
  LatLng centerPoint = const LatLng(31.5017125,34.4565447);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200, vertical: 200),
      child: Dialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: centerPoint,
            initialZoom: 5,
            maxZoom: 10,
            minZoom: 5,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              tileProvider: CancellableNetworkTileProvider(),
            ),
            InkWell(
              onTap: () {
                addServiceController.location = LatLng(
                  centerPoint.latitude,
                  centerPoint.longitude,
                );
                Get.back();
              },
              child: MarkerLayer(
                markers: [
                  Marker(
                    width: 60,
                    height: 60,
                    point: centerPoint,
                    child: Icon(
                      Icons.location_on_rounded,
                      color: Colors.redAccent,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
