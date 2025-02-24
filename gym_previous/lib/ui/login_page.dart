import 'package:flutter/material.dart';
import 'package:gym_previous/ui/home_page.dart';
import 'package:gym_previous/ui/search_page.dart';
import '../constants.dart';
import 'register_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Constants.primaryColor,
        title: Text(
          "Página de Inicio de Sesión",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/pre_inicio/fondo_login.jpg"
              ),
                fit: BoxFit.cover,
                opacity: 0.5
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Constants.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Inicio de Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CreateLabelWithTextField(campos: ["Usuario", "Contraseña"]),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(right: 110, left: 110),
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ingresar",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      IconButton(
                          onPressed: (){
                            setState(() {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
                            });
                          },
                        icon: Icon(Icons.arrow_forward, size: 30, color: Colors.white,)
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const Register()));
                    });
                  },
                child: Text("¿No tienes cuenta? Registrate")
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      )
    );
  }
}

class CreateLabelWithTextField extends StatelessWidget {
  final List<String> campos;
  const CreateLabelWithTextField({super.key, required this.campos});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              campos[0],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Ingrese su ${campos[0]}",
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              campos[1],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Ingrese su ${campos[1]}",
              filled: true,
              fillColor: Colors.white,
            ),
            obscureText: true
          ),
        )
      ],
    );
  }
}