import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var currentLocation = "Not fetched yet".obs;
  var isLoading = false.obs;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      isLoading(true);
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        currentLocation.value = "Location services are disabled.";
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          currentLocation.value = "Permissions denied.";
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      // Get Address from Coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentLocation.value = "${place.locality}, ${place.country}";
      }
    } catch (e) {
      currentLocation.value = "Error: $e";
    } finally {
      isLoading(false);
    }
  }
}
