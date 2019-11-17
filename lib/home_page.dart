import 'package:color_game/game_page/game_page.dart';
import 'package:flutter/material.dart';

import 'ui/base/action_button.dart';
import 'utils/image_loader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Text(
                  'ELEMENTS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/logo.png',
                  height: height * 0.5,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Center(
              child: Container(
                width: 140,
                height: 59,
                child: FutureBuilder(
                    future: ImageLoader().init([
                      'comp.png',
                      'ground.png',
                      'player.png',
                    ]),
                    builder: (context, data) {
                      if (data.hasData) {
                        return ActionButton(
                          title: 'New Game',
                          color: Colors.deepOrange,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GamePage(images: data.data)),
                            );
                          },
                        );
                      } else {
                        return Text('Loading...');
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
