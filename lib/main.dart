import 'package:flutter/material.dart';
import 'package:google_signin_ui_example/widget/sign_up_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn UI';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SignUpWidget(),
      );
}
