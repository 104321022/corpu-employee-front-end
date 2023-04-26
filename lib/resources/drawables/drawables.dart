class Drawables {
  String appLogo = 'app_logo'.svg;
}

extension PngImage on String {
  String get png => 'assets/images/$this.png';
}

extension SvgImage on String {
  String get svg => 'assets/icons/$this.svg';
}

extension JpgImage on String {
  String get jpg => 'assets/images/$this.jpg';
}
