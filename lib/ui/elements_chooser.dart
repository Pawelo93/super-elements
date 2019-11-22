import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_event.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_state.dart';
import 'package:color_game/model/field_type.dart';
import 'package:color_game/ui/base/element_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElementsChooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ElementChooserBloc bloc = BlocProvider.of<ElementChooserBloc>(context);
    return BlocBuilder<ElementChooserBloc, ElementChooserState>(
      builder: (context, ElementChooserState state) {
//        print('state $state');
        if (state is Selected) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button('Fire', state.fieldType == BoardFieldType.FIRE, Colors.red, () {
                bloc.add(ChangeElement(0));
              }),
              _button('Water', state.fieldType == BoardFieldType.WATER, Colors.blue, () {
                bloc.add(ChangeElement(1));
              }),
              _button('Air', state.fieldType == BoardFieldType.AIR, Colors.cyanAccent, () {
                bloc.add(ChangeElement(2));
              }),
            ],
          );
        } else
          return Text('Not selected');
      },
    );
  }

  Widget _button(String name, bool isSelected, Color color, Function onPress) {
    return GestureDetector(
      onTap: () => onPress,
      child: SizedBox(
        width: 90,
        height: 90,
        child: ElementButton(
          title: name,
          color: isSelected ? color : Colors.grey,
          onPress: onPress,
        ),
      ),
    );
  }
}
