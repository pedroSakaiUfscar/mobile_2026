import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/person_screen.dart';
import 'viewmodels/person_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final viewModel = await PersonViewModel.create();

  runApp(
    ChangeNotifierProvider.value(
      value: viewModel,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC10 - Floor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PersonScreen(),
    );
  }
}
