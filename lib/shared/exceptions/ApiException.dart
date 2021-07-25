class ApiException implements Exception {
  ApiException({
    this.msg = '',
    required this.code,
  });

  final String? msg;
  final int code;

  @override
  String toString() {
    return '$msg - code: $code';
  }
}
