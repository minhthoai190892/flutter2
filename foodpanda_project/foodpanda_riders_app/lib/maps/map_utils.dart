import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapUtils {
  MapUtils._();
  static void lauchMapFromSourceToDestination(
      {required sourceLat,
      required sourceLng,
      required destinationLat,
      required destinationLng}) async {
    String mapOptions = [
      // vị trí bắt đầu
      'saddr=$sourceLat,$sourceLng',
      // vị trí đích đến
      'daddr=$destinationLat,$destinationLng',
      // độ chính xác
      'dir_action=navigate'
    ].join('&');
    final mapUrl = 'https://www.google.com/maps?$mapOptions';
    if (await canLaunchUrlString(mapUrl)) {
      await launchUrlString(mapUrl);
    } else {
      throw 'Could not launch $mapUrl ';
    }
  }
}
