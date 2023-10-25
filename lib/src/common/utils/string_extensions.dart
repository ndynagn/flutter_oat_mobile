extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toDayOfWeek() {
    switch (this) {
      case 'mon':
        return 'Понедельник';
      case 'tue':
        return 'Вторник';
      case 'wed':
        return 'Среда';
      case 'thu':
        return 'Четверг';
      case 'fri':
        return 'Пятница';
      case 'sat':
        return 'Суббота';
      case 'sun':
        return 'Воскресенье';
      default:
        return '';
    }
  }
}
