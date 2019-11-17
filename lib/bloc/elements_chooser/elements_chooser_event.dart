abstract class ElementChooserEvent {

}

class ChooseElement extends ElementChooserEvent {
  final int id;

  ChooseElement(this.id);

  @override
  String toString() {
    return 'ChooseElement{id: $id}';
  }
}