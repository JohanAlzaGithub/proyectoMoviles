
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taller1/screens/bienvenida.dart';

void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),

      ),
      body:Cuerpo(context)
    );
  }
}

Widget Cuerpo(context){
  return (
    Column(
      children: <Widget>[
        Correo(context),
        Contrasena(context),
        BotonLogin(context)
      ],
    )
  );
}


TextEditingController _correo = TextEditingController();
Widget Correo(context){
  return Padding(padding: EdgeInsets.all(20.0),child: TextField(
    controller: _correo,
    decoration: InputDecoration(
      labelText: "Correo",
      border: OutlineInputBorder()
      
    ),
  )
  );
}


TextEditingController _contrasena = TextEditingController();
Widget Contrasena(context){
  return Padding(padding: EdgeInsets.all(20.0),child: TextField(
    controller: _contrasena,
    decoration: InputDecoration(
      labelText: "Contraseña",
      border: OutlineInputBorder()
    ),
  ));
}

Widget BotonLogin(context){
  return(
     FilledButton(onPressed: (){
      Log(context);

    },
     child: Text('Login'))
  );
}

void Log(context) async{
 try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,
    password: _contrasena.text
  );
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=>Bienvenida()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}
