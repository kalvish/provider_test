import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "title 1d";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      builder: (context) => Data(title),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              S1L1(),
              S2L1(),
            ],
          ),
        ),
      ),
    );
  }
}

class S1L1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: S1L2(),
    );
  }
}

class S2L1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: S2L2(),
    );
  }
}

class S1L2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Consumer<Data>(
            builder: (context, data, child) {
              return Text(data.data);
            },
          ),
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: TextField(
              onChanged: (newText) {
                Provider.of<Data>(context).changeString(newText);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class S2L2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Provider.of<Data>(context, listen: false).data),
    );
  }
}

class Data extends ChangeNotifier {
  String data = "This is special data";

  Data(this.data) {
    data = 'testsets';
  }

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
