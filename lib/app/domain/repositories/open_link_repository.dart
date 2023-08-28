import 'package:dartz/dartz.dart';

abstract class OpenLinkRepository {
  Future<Either<Exception, void>> openLink(Uri url);
}