import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/WelcomePage.dart';
import 'model/StepModel.dart';

void main() {
  runApp(ChangeNotifierProvider<StepModel>(
      create: (context) => StepModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeHome(),
      )));
}
