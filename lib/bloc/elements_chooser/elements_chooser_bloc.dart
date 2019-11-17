import 'package:color_game/bloc/elements_chooser/elements_chooser_event.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_state.dart';
import 'package:bloc/bloc.dart';

class ElementChooserBloc extends Bloc<ElementChooserEvent, ElementChooserState> {

  @override
  ElementChooserState get initialState => ElementSelectedState(1);

  @override
  Stream<ElementChooserState> mapEventToState(ElementChooserEvent event) async* {
    if(event is ChooseElement)
      yield ElementSelectedState(event.id);
  }

}