import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  // Google map controller
  final Completer<GoogleMapController> gController = Completer();

  // Markers list
  RxSet<Marker> markers = <Marker>{}.obs;

  // Initial camera position
  static const CameraPosition initialCamera = CameraPosition(
    target: LatLng(24.8607, 67.0011),
    zoom: 12,
  );

  // Ask for permission + get current location
  Future<Position?> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check GPS ON/OFF
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Please enable location services");
      return null;
    }

    permission = await Geolocator.checkPermission();

    // Ask permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permission denied");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Error",
        "Permission denied permanently. Enable from settings.",
      );
      return null;
    }

    // Permission granted → get location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  //Show my location (called from button)

  Future<void> showMyLocation() async {
    final pos = await _getLocation();
    if (pos == null) return;

    LatLng latLng = LatLng(pos.latitude, pos.longitude);

    // Add marker
    Marker marker = Marker(
      markerId: const MarkerId("my_location"),
      position: latLng,
      infoWindow: const InfoWindow(title: "My Location"),
    );

    markers.clear();
    markers.add(marker);

    update();

    // Move camera to my location
    final GoogleMapController mapController = await gController.future;

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 16)),
    );
  }
}
