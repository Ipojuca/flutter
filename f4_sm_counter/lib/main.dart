import 'dart:developer';

import 'package:f4_sm_counter/screen/PrimaryCounterScreen.dart';
import 'package:f4_sm_counter/screen/SecondaryCounterScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SMCounter());
}

class SMCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) =>Counter(name, description) ),
      child: MaterialApp(
        title: 'State Management Counter',
        initialRoute: '/',
        routes: {
          '/': (context) => PrimaryCounterScreen(),
          '/secondary-screen': (context) => SecondaryCounterScreen(),
        },
      ),
    );
  }
}
