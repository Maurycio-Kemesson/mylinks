import 'package:dartz/dartz.dart';
import 'package:mylinks/app/domain/repositories/open_link_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenLinkRepositoryImpl implements OpenLinkRepository {
  @override
  Future<Either<Exception, void>> openLink(Uri url) async {
    try {
      bool result = await launchUrl(url, mode: LaunchMode.inAppWebView);
      if (!result) {
        throw Exception();
      }
      return const Right(null);
    } catch (e) {
      return Left(
        Exception(
            'Ocorreu um erro ao tentar acessar o link, tente novamente mais tarde.'),
      );
    }
  }
}
