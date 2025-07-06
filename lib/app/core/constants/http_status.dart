class HttpStatusCodes {
  static const ERROR_CODES   = [500, 401];
  static const SUCCESS_CODES = [200, 201, 204, 400];

  static bool isErrorCode(value) {
    return ERROR_CODES.contains(value);
  }

  static bool isSuccessCode(value) {
    return SUCCESS_CODES.contains(value);
  }

  static bool isValidCode(value) {
    return [...SUCCESS_CODES, ...ERROR_CODES].contains(value);
  }
}