abstract class ProfileImageEvent {}

class ProfileImageIncressAndDcressEvent extends ProfileImageEvent {
  final int currentNo;

  ProfileImageIncressAndDcressEvent(this.currentNo);
}