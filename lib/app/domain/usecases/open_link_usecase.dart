import 'package:dartz/dartz.dart';

abstract class OpenLinkUsecase {
   Future<Either<Exception, void>> call(Uri url);
}