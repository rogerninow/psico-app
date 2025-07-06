class Configuration {
  //Environment constants
  static const PRODUCTION = true;
  static const DEBUG_MODE = true;
  // APP constants
  static const APP_TITLE = 'Psico App';
  // Logic constants
  static const MESSAGES_DURATION  = Duration(seconds: 5);
  static const HTTP_TIMEOUT       = Duration(seconds: 30);
  static const BG_INTERVAL        = 125;
  static const BG_TIMEOUT         = Duration(seconds: 30);
  static const LOGOUT_INTERVAL    = Duration(seconds: 15);
}