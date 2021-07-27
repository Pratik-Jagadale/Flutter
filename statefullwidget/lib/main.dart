import 'package:flutter/material.dart';

void main() => runApp(Statefullwidget());

class Statefullwidget extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("StateFull Widget Application"),
            ),
            body: Column(
              children: [
                Text("StateFull Window"),
                ElevatedButton(child: Text('Naswer'), onPressed: null),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Answer 2'),
                ),
              ],
            ))));
  }
}
