import 'package:flutter/material.dart';

class RecommendationSection extends StatelessWidget {
  // Lista de imágenes
  final List<String> imgList = [
    'assets/images/examplegym/carrusel_image.jpg',
    'assets/images/examplegym/carrusel_imagen_2.jpg',
    'assets/images/examplegym/pesas_image.jpg',
    'assets/images/examplegym/Foto-Slider.jpg',
    'assets/images/examplegym/Image3.jpg',
    'assets/images/examplegym/Image4.jpg',
    'assets/images/examplegym/Image5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "ℜ𝔢𝔠𝔬𝔪𝔢𝔫𝔡𝔞𝔠𝔦𝔬𝔫𝔢𝔰",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 280,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}