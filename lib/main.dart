import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'Authenticate.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Shop"),
        shadowColor: Colors.transparent,
        titleTextStyle: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              child: Transform.rotate(
                origin: const Offset(-39, -100),
                angle: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 2,
                child: SvgPicture.asset("images/intro.svg"),
              ),
            ),
            // Positioned(
            //   bottom: -60,
            // left MediaQuery.of(context).size.height / 8,
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 6,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Authenticate(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shop_2_rounded,
                ),
                label: Text(
                  "Shop now",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}
