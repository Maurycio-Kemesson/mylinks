import 'package:dartz/dartz.dart';
import 'package:mylinks/app/domain/repositories/open_link_repository.dart';
import 'package:mylinks/app/domain/usecases/open_link_usecase.dart';

class OpenLinkUsecaseImpl implements OpenLinkUsecase {
  final OpenLinkRepository repository;

  OpenLinkUsecaseImpl(this.repository);

  @override
   Future<Either<Exception, void>> call(Uri url) async {
    return await repository.openLink(url);
  }
}
