class NetworkConfig {
  static String developmentBaseUrl = 'qmtech.free.beeceptor.com';
  static String releaseBaseUrl = '';
}

//app Flavours
enum Flavour {
  development,
  release,
}

class Config {
  static Flavour? appFlavour;

  static String get baseUrl {
    switch (appFlavour) {
      case Flavour.development:
        return NetworkConfig.developmentBaseUrl;
      case Flavour.release:
        return NetworkConfig.releaseBaseUrl;
      default:
        return '';
    }
  }
}
