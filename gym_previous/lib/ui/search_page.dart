import 'package:flutter/material.dart';
import 'package:gym_previous/ui/home_page.dart';
import 'package:gym_previous/ui/login_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            setState(() {
              // Change to Navigator.pop()
              Navigator.pop(context);
            });
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              "Buscar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search)
              ),
            )
          ],
        ),
      ),
    );
  }
}
