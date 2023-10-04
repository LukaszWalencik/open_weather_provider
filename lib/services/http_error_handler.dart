import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) {
  final responsePhase = response.reasonPhrase;
  final statusCode = response.statusCode;
  final String errorMessage =
      'Request failer\nStatus code: $statusCode\nReason: $responsePhase';

  return errorMessage;
}
