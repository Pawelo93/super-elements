import 'package:color_game/domain/repositories/elements_repository.dart';
import 'package:color_game/model/field_type.dart';
import 'package:bloc/bloc.dart';

import 'elements_chooser_event.dart';
import 'elements_chooser_state.dart';

class ElementChooserBloc extends Bloc<ElementChooserEvent, ElementChooserState>{
  final ElementsRepository elementsRepository;

  ElementChooserBloc(this.elementsRepository);

  @override
  ElementChooserState get initialState => Selected(BoardFieldType.FIRE);

  @override
  Stream<ElementChooserState> mapEventToState(ElementChooserEvent event) async* {
    if(event is ChangeElement) {
      BoardFieldType fieldTypeAtPosition = elementsRepository.getAtPosition(event.position);
      yield Selected(fieldTypeAtPosition);
    }
  }

}