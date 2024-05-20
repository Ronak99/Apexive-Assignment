class CustomException implements Exception {
  const CustomException({
    this.message = 'An unknown exception occurred.',
  });
  final String message;
}
