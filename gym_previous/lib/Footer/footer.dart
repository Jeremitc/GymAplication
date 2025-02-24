import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomFooter({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Plan'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mensajes'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}
