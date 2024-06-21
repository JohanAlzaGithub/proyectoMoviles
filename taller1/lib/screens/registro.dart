
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taller1/screens/login.dart';
import 'package:firebase_database/firebase_database.dart';

void main(){
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),

      ),
      body:SingleChildScrollView(
        child: Cuerpo(context),
     ),
    );
  }
}

Widget Cuerpo(context){
  return (
    Column(
      children: <Widget>[
        User(context),
        Correo(context),
        Contrasena(context),
        BotonRegistro(context)
      ],
    )
  );
}


TextEditingController _user = TextEditingController();
Widget User(context){
  return Padding(padding: EdgeInsets.all(20.0),child: TextField(
    controller: _user,
    decoration: InputDecoration(
      labelText: "Usuario",
      border: OutlineInputBorder()
      
    ),
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

Widget BotonRegistro(context){
  return(
     FilledButton(onPressed: (){
      Regis(context);
      GuardarUser();
    },
     child: Text('Registro'))
  );
}

void Regis(context) async{
 try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _correo.text,
    password: _contrasena.text,
     );
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=>Login()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}

 void GuardarUser() {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    // Ejemplo de datos a guardar
    Map<String, dynamic> datos = {
      'usuario': _user.text,
      'correo': _correo.text
    };
  

    // Guardar datos en la base de datos
    ref.child('usuarios').child(_user.text).set(datos).then((value) {
      print('Datos guardados correctamente');
    }).catchError((error) {
      print('Error al guardar datos: $error');
    });
  }



