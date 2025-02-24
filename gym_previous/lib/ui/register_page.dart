import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      "assets/images/pre_inicio/registro_2.jpg"
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
                      "Registro",
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
                          "Registrarse",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        IconButton(
                            onPressed: (){
                              setState(() {
                                // Will be implement later
                                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Register()));
                              });
                            },
                            icon: Icon(Icons.supervised_user_circle, size: 30, color: Colors.white,)
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Login()));
                        Navigator.pop(context);
                      });
                    },
                    child: Text("¿Tienes una cuenta? Inicia Sesión")
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