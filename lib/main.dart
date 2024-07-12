import 'package:flutter/material.dart';
import 'package:todoapps/application/pages/home_page/home_page.dart';
import 'injection.dart' as di;

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDo Apps',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
          ),
          home: const HomePage(),
        );
      }
}