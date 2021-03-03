import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // print(position);
    } catch (e) {
      print(e);
    }
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
