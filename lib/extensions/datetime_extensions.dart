DateTime? parseSlashSeparatedDate(String date) {
  try {
    final parts = date.split('/');
    if (parts.length == 3) {
      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);
      if (day == null || month == null || year == null) return null;
      return DateTime(year, month, day);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

extension SlashString on DateTime {
  String toSlashString() {
    return "$day/$month/$year";
  }

  DateTime? trySlashParse(String date) {
    return parseSlashSeparatedDate(date);
  }

  String toMonthString() {
    final months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return "$day ${months[month - 1]} $year";
  }

  String getTime() {
    final localTime = toLocal();
    return "${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
  }

  String get amPmTime {
    final localTime = toLocal();
    final ampm = localTime.hour >= 12 ? "pm" : "am";
    final hourIn12 = localTime.hour > 12 ? localTime.hour - 12 : localTime.hour;
    return "$hourIn12:${localTime.minute.toString().padLeft(2, '0')} $ampm";
  }

  String get time {
    return "$hour:$minute";
  }

  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}m";
    } else {
      return "now";
    }
  }
}
