import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var isLoading = false.obs;
  var locationPermissionStatus = ''.obs;
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
  
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }
  Future<void> requestLocationPermission() async {
    isLoading.value = true;
    try {
      bool serviceEnabled = await isLocationServiceEnabled();
      
      if (!serviceEnabled) {
        Get.snackbar(
          'Location Service Disabled',
          'Please enable location services',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
        return;
      }
      LocationPermission permission = await checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            'Permission Denied',
            'Location permission is required to find nearby salons',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );
          isLoading.value = false;
          return;
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        await openAppSettings();
        isLoading.value = false;
        return;
      }
      
      if (permission == LocationPermission.whileInUse || 
          permission == LocationPermission.always) {
        locationPermissionStatus.value = 'granted';
        
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        
        print('Current Location: ${position.latitude}, ${position.longitude}');
        
        Get.snackbar(
          'Success',
          'Location access enabled',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        
       
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to get location: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  
  void skipLocationPermission() {
    Get.snackbar(
      'Skipped',
      'You can enable location later in settings',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
