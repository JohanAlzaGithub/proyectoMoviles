import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taller1/main.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  User? user = FirebaseAuth.instance.currentUser;
  String correo = "";
  String nombreUsuario = "Nombre de usuario no disponible";

  @override
  void initState() {
    super.initState();
    obtenerDatosUsuario();
  }

  void obtenerDatosUsuario() async {
    if (user != null) {
      setState(() {
        correo = user!.email ?? "Correo no disponible";
      });

      DatabaseReference ref = FirebaseDatabase.instance.ref().child('usuarios');
      Query query = ref.orderByChild('correo').equalTo(correo);

      query.once().then((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> usuarios = event.snapshot.value as Map<dynamic, dynamic>;
          usuarios.forEach((key, value) {
            if (value['correo'] == correo) {
              setState(() {
                nombreUsuario = value['usuario'] ?? "Nombre de usuario no disponible";
              });
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/login.jpg', width: 100, height: 100),
            SizedBox(height: 20),
            Text(
              'Nombre de usuario:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$nombreUsuario',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Correo:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$correo',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            _buildCerrarSesionButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCerrarSesionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Cuerpo(context)),
          (route) => false, // Elimina todas las rutas de navegación
        );
      },
      child: Text("Cerrar Sesión"),
    );
  }
}
