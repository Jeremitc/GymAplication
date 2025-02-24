import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProgramPage extends StatelessWidget {
  // Lista de imágenes para el carrusel
  final List<String> imgList = [
    'assets/images/programs/icono-athletic-training.png',
    'assets/images/programs/icono-functional-training.png',
    'assets/images/programs/icono-programas-cycling.png',
    'assets/images/programs/icono-programas-dance.png',
    'assets/images/programs/icono-programas-move-energy.png',
    'assets/images/programs/icono-programas-musculacion_1.png',
    'assets/images/programs/icono-programas-natacion.png',
    'assets/images/programs/icono-programas-pilates.png',
    'assets/images/programs/icono-programas-yoga.png',
  ];

  // Color gris muy suave
  final Color softGrayColor = Colors.grey[50]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: softGrayColor,
      child: Column(
        children: [
          Container(
            color: softGrayColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,

            child: Text(
              "𝘚𝘌𝘓𝘌𝘊𝘊𝘐𝘖𝘕𝘈 𝘛𝘜 𝘗𝘙𝘖𝘎𝘙𝘈𝘔𝘈 ●︿●",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imgList.map((item) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(1, 5),
                  ),
                ],
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}