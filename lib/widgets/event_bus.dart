import 'package:event_bus/event_bus.dart';
/// 创建EventBus
EventBus eventBus = EventBus();
class UserLoggedInEvent {
  String text;

  UserLoggedInEvent(this.text);
}