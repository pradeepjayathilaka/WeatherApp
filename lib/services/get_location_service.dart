import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetLocationService {
  Future<String> getCityNameFromLocation() async {
    //get the permition  from the user  to access the location

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print(position.latitude);
    print(position.longitude);

    //conver the location into list of place marks
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    //extract the city name from the place marks
    String cityName = placeMarks[0].locality!;
    print(cityName);
    return cityName;
  }
}
