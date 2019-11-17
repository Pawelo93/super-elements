import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_event.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_state.dart';
import 'package:color_game/ui/base/element_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElementsChooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ElementChooserBloc bloc =
        BlocProvider.of<ElementChooserBloc>(context);
    return BlocBuilder<ElementChooserBloc, ElementChooserState>(
      builder: (context, ElementChooserState state) {
        if (state is ElementSelectedState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button('Fire', state.position == 1, Colors.red, () {
                bloc.add(ChooseElement(1));
              }),
              _button('Water', state.position == 2, Colors.blue, () {
                bloc.add(ChooseElement(2));
              }),
              _button('Air', state.position == 3, Colors.cyanAccent, () {
                bloc.add(ChooseElement(3));
              }),
            ],
          );
        } else
          return Container();
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
