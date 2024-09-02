import 'package:intl/intl.dart';

class Utils {
  static String getFormattedDate(String date) {
    DateTime convertedDate = DateTime.parse(date);
    DateTime now = DateTime.now();
    var difference = now.difference(convertedDate);

    if (difference < const Duration(minutes: 1)) {
      return 'Just now';
    } else if (difference < const Duration(hours: 1)) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference < const Duration(days: 1)) {
      return '${difference.inHours} hours ago';
    } else if (difference < const Duration(days: 7)) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('dd/MM/yyyy').format(convertedDate);
    }
  }

  static String getFormattedDuration(String duration) {
    List<String> durationParts = duration.split(':');

    Duration durationFormat = Duration(
      hours: int.parse(durationParts[0]),
      minutes: int.parse(durationParts[1]),
      seconds: int.parse(durationParts[2].split('.')[0]),
    );

    String negativeSign = durationFormat.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(durationFormat.inMinutes.abs());
    String twoDigitSeconds =
        twoDigits(durationFormat.inSeconds.remainder(60).abs());
    return "$negativeSign$twoDigitMinutes:$twoDigitSeconds";
  }
}
