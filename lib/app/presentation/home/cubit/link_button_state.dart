abstract class LinkButtonState {}

final class LinkButtonInitial extends LinkButtonState {}

final class LoadingLinkButton extends LinkButtonState {}

final class ErrorLinkButton extends LinkButtonState {
  final String erroMessage;

  ErrorLinkButton({required this.erroMessage});
}
