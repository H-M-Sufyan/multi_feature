import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_feature/controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());

    return Scaffold(
      appBar: AppBar(title: const Text("Google Map")),

      body: GetBuilder<MapController>(
        builder: (c) {
          return GoogleMap(
            initialCameraPosition: MapController.initialCamera,
            markers: c.markers,
            mapType: MapType.normal,

            onMapCreated: (GoogleMapController googleMapController) {
              if (!c.gController.isCompleted) {
                c.gController.complete(googleMapController);
              }
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          bottom: 20.0
        ), // move away from zoom buttons
        child: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: controller.showMyLocation,
            child: const Icon(Icons.my_location),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
