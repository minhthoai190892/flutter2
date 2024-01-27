import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapsUtils {
  MapsUtils._();
  static Future<void> openMapWithPosition(
      double latitude, double longitude) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(googleMapUrl))) {
      await launchUrl(Uri.parse(googleMapUrl));
    } else {
      throw 'Could not open the map';
    }
  }

  static Future<void> openMapWithAddress(String fullAddress) async {
    final query = Uri.encodeComponent(fullAddress);
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$query";
    if (await canLaunchUrlString(googleMapUrl)) {
      await launchUrlString(googleMapUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}
