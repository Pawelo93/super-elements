import 'package:equatable/equatable.dart';

abstract class ElementChooserState extends Equatable {

  ElementChooserState([List props = const []]) : super(props);
}

class ElementSelectedState extends ElementChooserState {
  final int position;

  ElementSelectedState(this.position) : super([position]);

  @override
  String toString() {
    return "ElementSelectedState {position: $position}";
  }
}