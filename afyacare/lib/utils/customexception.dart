class UnAuthorizedException implements Exception {
  String? message;
  UnAuthorizedException(this.message);
}

class ForbiddenException implements Exception {
  String? message;
  ForbiddenException(this.message);
}

class BadRequestException implements Exception {
  String? message;
  BadRequestException(this.message);
}


class NotFoundException implements Exception{
  String? message;
  NotFoundException(this.message);
}



