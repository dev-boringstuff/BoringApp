class BoringParams {
  final Map<String, String> pathParams;
  final Map<String, String> queryParams;

  BoringParams(
      {this.pathParams = const <String, String>{},
      this.queryParams = const <String, String>{}});
}
