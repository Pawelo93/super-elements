import 'package:equatable/equatable.dart';

abstract class ElementChooserEvent extends Equatable {
  ElementChooserEvent([List props = const []]) : super(props);
}

class ChangeElement extends ElementChooserEvent {
  final int position;

  ChangeElement(this.position) : super([position]);

  @override
  String toString() => 'ChangeElement {position: $position}';
}
