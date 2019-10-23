import 'package:color_game/bloc/elements_chooser/elements_chooser_event.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_state.dart';
import 'package:bloc/bloc.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/repositories/field_types_repository.dart';

class ElementChooserBloc extends Bloc<ElementChooserEvent, ElementChooserState>{
  final FieldTypesRepository fieldTypesRepository;

  ElementChooserBloc(this.fieldTypesRepository);

  @override
  ElementChooserState get initialState => Uninitialized();

  @override
  Stream<ElementChooserState> mapEventToState(ElementChooserEvent event) async* {
    if(event is ChangeElement) {
      FieldType fieldTypeAtPosition = fieldTypesRepository.getAtPosition(event.position);
      yield Selected(fieldTypeAtPosition);
    }
  }

}