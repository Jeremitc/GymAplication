import 'package:flutter/material.dart';
import 'package:gym_previous/ui/search_page.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  late BuildContext ancestorContext;  // Variable to store context

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safely store the context when dependencies change
    ancestorContext = context;
  }

  @override
  void dispose() {
    // Do not try to access context here. Just clean up if needed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Aumentamos el padding superior para mover el contenido hacia abajo
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16), // Aumentamos el padding superior
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
              ),
            ],
          ),
          height: 100,  // Mantener la altura del header igual
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "𝓖𝓎𝓶 𝒶𝓅𝓹",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      blurRadius: 3,
                      color: Colors.black12,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
                    },
                    child: Icon(Icons.search, color: Colors.black)
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Icon(Icons.settings, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) {
    // Check if the widget is still mounted before proceeding
    if (!mounted) return;  // Return early if widget is no longer mounted

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(300, 100, 0, 0),  // Ajustamos la posición del menú
      items: [
        const PopupMenuItem<String>(
          value: 'Configuración',
          child: Text('Configuración'),
        ),
        const PopupMenuItem<String>(
          value: 'Condiciones y Política de Privacidad',
          child: Text('Condiciones y Política de Privacidad'),
        ),
        const PopupMenuItem<String>(
          value: 'Ayuda y Comentarios',
          child: Text('Ayuda y Comentarios'),
        ),
      ],
      elevation: 8.0,
    ).then((String? value) {
      if (!mounted) return;  // Ensure widget is still mounted before taking action

      if (value != null) {
        switch (value) {
          case 'Configuración':
            print('Ir a Configuración');
            break;
          case 'Condiciones y Política de Privacidad':
            print('Ir a Condiciones');
            break;
          case 'Ayuda y Comentarios':
            print('Ir a Ayuda');
            break;
          default:
            print('Opción no válida');
        }
      }
    });
  }
}
