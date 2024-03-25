import 'package:flutter/material.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/provider/add_provider.dart';
import 'package:h1/provider/data_provider.dart';
import 'package:h1/provider/edit_provider.dart';
import 'package:h1/screens/splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddProvider()),
        ChangeNotifierProvider(create: (context)=>Editprovider()),
        ChangeNotifierProvider(create: (context)=>StudnetProvier()),
        
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: const splashScreen(),
      ),
    );
  }
}
