extension StringExtension on String {
  String camelCaseString() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
