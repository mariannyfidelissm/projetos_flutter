import 'dart:async';
import 'package:logger/logger.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    logger.i("Requisição para: ${request.url}\n${request.headers}\n");
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    logger.i("Resposta de: ${response.headers.keys}\n${response.statusCode}\n");
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}
