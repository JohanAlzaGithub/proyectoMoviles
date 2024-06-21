import 'package:flutter/material.dart';
import 'package:taller1/screens/catalogo.dart';
import 'package:taller1/screens/user.dart';

void main() {
  runApp(const Bienvenida());
}

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark() // Cambiar a tema oscuro para mejor apariencia
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// INDICE
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    /// Páginas
    List<Widget> screens = [
      Cuerpo(),
      Catalogo(),
      Perfil(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("JoFlixx"),
      ),
      body: screens[indice],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Catálogo"),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Usuario")
        ],
      ),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/fondo.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "¡Bienvenido a JoFlixx!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Nos alegra tenerte aquí. Explora nuestra amplia selección de películas de todos los géneros y épocas. Prepárate para descubrir, revivir y compartir tus películas favoritas. ¡Gracias por elegirnos y disfruta la función!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 40),                            
            ],
          ),
        ),
      ],
    );
  }
}
