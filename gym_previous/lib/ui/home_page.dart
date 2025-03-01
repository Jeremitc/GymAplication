
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Contactoform/formulario.dart';
import '../Examplegym/examplegym.dart';
import '../Footer/footer.dart';
import '../Header/header.dart';
import '../Program/program.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isScrollingUp = false;
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  void _handleFormSubmit(String name, String email, String message) {
    // Aquí tu lógica para manejar los datos
    print('Datos recibidos: $name, $email, $message');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mensaje enviado con éxito')),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.reverse) {
                setState(() {
                  isScrollingUp = false;
                });
              } else if (notification.direction == ScrollDirection.forward) {
                setState(() {
                  isScrollingUp = true;
                });
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 110), // Space for header
                  buildContent(),
                  const SizedBox(height: 80), // Space for footer
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,  // Fijo en la parte superior
            left: 0,
            right: 0,
            child: const CustomHeader(),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        ProgramPage(),
        SizedBox(height: 40,),//Separacion Carrusel con Recomendaciones
        RecommendationSection(),
        ContactForm(onSubmit: _handleFormSubmit,),// Aquí es donde llamamos a la sección de recomendaciones
      ],
    );
  }
}