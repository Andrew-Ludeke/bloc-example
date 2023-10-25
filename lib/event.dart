sealed class Event {}

final class UserPressedButton extends Event {}

final class RepositoryStreamUpdated extends Event {
  final int value;

  RepositoryStreamUpdated({required this.value});
}