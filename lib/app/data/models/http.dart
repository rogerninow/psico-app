import 'package:psico_app/app/core/helpers/formatter.dart';
class ResponseBody {
  bool success;
  List? data;
  String? message;
  String? status;

  ResponseBody({
    required this.success,
    this.data,
    this.message,
    this.status
  });
}

class RequestParameters {
  String? baseUrl;
  Map<String, Object?>? payload;
  bool? sync;
  bool? suppressMessages;

  RequestParameters({
    this.baseUrl,
    this.payload,
    this.sync,
    this.suppressMessages
  });

  String getUrl(url) {
    return hasValue(this.baseUrl) ? this.baseUrl : url;
  }

  bool needSync() {
    return hasValue(this.sync) && this.sync == true;
  }

  bool showMessages() {
    return !hasValue(this.suppressMessages) || this.suppressMessages == false;
  }
}