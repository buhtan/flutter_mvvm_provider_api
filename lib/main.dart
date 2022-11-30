import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider_api/view/user_view.dart';
import 'package:flutter_mvvm_provider_api/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => userViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Posts app',
        theme: ThemeData.dark(),
        home: userView(),
      ),
    );
  }
}
