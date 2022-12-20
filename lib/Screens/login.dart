import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:managment/data/listdata.dart';
import 'package:managment/data/model/add_date.dart';
import 'package:managment/data/utlity.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();




}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //Initializale Firebase App


  Future<FirebaseApp> _initializeFirebase() async
  {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(





      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

              Text("App Finances \n",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 44.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //box de email
              SizedBox(
                height: 44.0,
              ),
              //propriedades de tela de login
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email do Usuario",
                  prefixIcon: Icon(Icons.mail, color: Colors.black),
                ),

              ),

              SizedBox(
                  height: 26.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha do Usuario",
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                ),

              ),


            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle:
                const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
              ),

              onPressed: () => Navigator.pop(context, 'Esqueceu a senha'),


              child: const Text('Esqueceu a senha'),
            ),

            SizedBox(
              height: 88.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Color(0xFF0069FE),
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () {},
                child: Text("Login"),


              ),
            ),





          ],
        ),
      ),

    );
  }
}