import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylinks/app/domain/usecases/open_link_usecase.dart';
import 'package:mylinks/app/presentation/home/cubit/link_button_state.dart';

class LinkButtonBloc extends Cubit<LinkButtonState> {
  LinkButtonBloc(this.openLinkUsecase) : super(LinkButtonInitial());

  final OpenLinkUsecase openLinkUsecase;

  openLink(Uri url) async {
    emit(LoadingLinkButton());
    var result = await openLinkUsecase.call(url);
    emit(
      result.fold(
        (l) => ErrorLinkButton(erroMessage: l.toString()),
        (r) => LinkButtonInitial(),
      ),
    );
  }
}
