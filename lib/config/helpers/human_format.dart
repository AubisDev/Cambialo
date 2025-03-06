class HumanFormat {
  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Hoy';
    } else if (difference == 1) {
      return 'Ayer';
    } else {
      return 'Hace $difference días';
    }
  }

  static String formatDateUserSince(DateTime date) {
    final now = DateTime.now();
    final differenceInYears = (now.difference(date).inDays / 365.25).floor();

    if (differenceInYears == 0) {
      return 'este año';
    } else if (differenceInYears == 1) {
      return 'hace $differenceInYears año';
    } else {
      return 'hace $differenceInYears años';
    }
  }
}
