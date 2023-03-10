
enum MethodApi {
  GET,
  POST,
  PUT,
  DELETE,
  UPLOAD
}
extension MethodExtension on MethodApi {
  String get valueOf{
    switch (this) {
      case MethodApi.GET:
        return 'GET';
      case MethodApi.POST:
        return 'POST';
      case MethodApi.PUT:
        return 'PUT';
      case MethodApi.DELETE:
        return 'DELETE';
      default:
        return '';
    }
  }
}