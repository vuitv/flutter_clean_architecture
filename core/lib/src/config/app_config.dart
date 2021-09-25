enum Environment { DEV, STAGING, PROD }

class AppConfig {
  late Environment environment;
  late Map<String, dynamic> _config;

  String get baseUrl => _config[_Config.BASE_URL];

  AppConfig(this.environment) {
    switch (environment) {
      case Environment.DEV:
        _config = _Config.devConstants;
        break;
      case Environment.STAGING:
        _config = _Config.stagingConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }
}

class _Config {
  static const BASE_URL = 'BASE_URL';

  static Map<String, dynamic> devConstants = {
    BASE_URL: 'https://api-dev',
  };

  static Map<String, dynamic> stagingConstants = {
    BASE_URL: 'https://api-staging',
  };

  static Map<String, dynamic> prodConstants = {
    BASE_URL: 'https://api-product',
  };
}
