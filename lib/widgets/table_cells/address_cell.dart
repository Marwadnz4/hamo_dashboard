import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:latlong2/latlong.dart';

DataCell addressCell({
  required LatLng address,
  required BuildContext context,
}) => DataCell(
  InkWell(
    onTap: () {
      showMapDialog(context, address);
    },
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Icon(
        Icons.location_on_outlined,
        size: 25,
        color: ColorsManager.primary,
      ),
    ),
  ),
);


Future<dynamic> showMapDialog(BuildContext context, LatLng address) {
  final MapController mapController = MapController();

  return showDialog(
    context: context,
    builder:
        (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 400, vertical: 200),
          child: Dialog(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: FlutterMap(
              mapController: mapController,
              options: const MapOptions(
                initialCenter: LatLng(33.1181699, 38.4245055),
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
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 60,
                      height: 60,
                      point: LatLng(address.latitude, address.longitude),
                      child: Icon(
                        Icons.location_on_rounded,
                        color: Colors.redAccent,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
  );
}
