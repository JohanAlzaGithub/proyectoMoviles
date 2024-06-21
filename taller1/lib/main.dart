import 'package:flutter/material.dart';
import 'package:taller1/screens/login.dart';
import 'package:taller1/screens/registro.dart';
import 'package:firebase_core/firebase_core.dart'; 



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
runApp(Proyecto());
}

class Proyecto extends StatelessWidget {
  const Proyecto({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark(),        // Cambiar a tema oscuro para mejor apariencia
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Cuerpo(context)
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz096V3f4JK-mNPO9AD5u1c9gmICIzU3B6ahakQtt3Tn1HhplgYToQfeMLqSBlVWtQmV0&usqp=CAU'),
        fit: BoxFit.cover,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "JoFlixx",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              BotonLogin(context),
              const SizedBox(height: 10),
              BotonRegistro(context),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget BotonLogin(BuildContext context) {
  return FilledButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    },
    child: const Text('Login'),
  );
}

Widget BotonRegistro(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.cyan,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    },
    child: const Text('Registro'),
  );
}