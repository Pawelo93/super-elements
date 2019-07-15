import 'package:color_game/model/states/field_type.dart';
import 'package:flutter/material.dart';

import 'board_view.dart';
import 'element_controller.dart';

class GamePage extends StatefulWidget {
  final String title;

  GamePage(this.title);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  ElementController elementController = ElementController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: BoardView(elementController),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: null,
                child: Text(
                  "Next round!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _fireButton(),
              _waterButton(),
              _airButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _fireButton() {
    return GestureDetector(
      onTap: () => setState(() {
        elementController.setFire();
      }),
      child: SizedBox(
        width: 70,
        height: 70,
        child: _fill(
          elementController.actualElement != FieldType.FIRE,
          Colors.red,
        ),
      ),
    );
  }

  Widget _waterButton() {
    return GestureDetector(
      onTap: () => setState(() {
        elementController.setWater();
      }),
      child: SizedBox(
        width: 70,
        height: 70,
        child: _fill(
          elementController.actualElement != FieldType.WATER,
          Colors.blue,
        ),
      ),
    );
  }

  Widget _airButton() {
    return GestureDetector(
      onTap: () => setState(() {
        elementController.setAir();
      }),
      child: SizedBox(
        width: 70,
        height: 70,
        child: _fill(
          elementController.actualElement != FieldType.AIR,
          Colors.cyanAccent,
        ),
      ),
    );
  }

  Widget _fill(bool filled, Color color) {
    if (filled)
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 8,
          ),
        ),
      );
    else
      return Container(
        color: color,
      );
  }
}
