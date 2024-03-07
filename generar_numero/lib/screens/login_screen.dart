import 'package:flutter/material.dart';
import 'package:generar_numero/screens/menu_sceen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  String nombreUsuario = "";
  String contrasena = "";
  //Creamos un array de usuarios y contraseña
  var usuarios = {};
  void registrarse() {
    //Añadimos el usuario al array
    usuarios = {usuarioController.text: contrasenaController.text};
    //Mostramos una alerta que nos diga registro exitoso
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registro Exitoso'),
            content:
                Text('El usuario ${usuarioController.text} ha sido registrado'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aceptar'))
            ],
          );
        });
  }

  void iniciarSesion() {
    //Validamos si el usuario y contraseña existen
    if (usuarios.containsKey(usuarioController.text)) {
      if (usuarios[usuarioController.text] == contrasenaController.text) {
        //Mostramos una alerta que nos diga que el usuario ha iniciado sesion
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Inicio de Sesion Exitoso'),
                content: Text(
                    'El usuario ${usuarioController.text} ha iniciado sesion'),
                actions: [
                  TextButton(
                      onPressed: () {
                        final route = MaterialPageRoute(
                            builder: (context) => const MenuScreen());
                        Navigator.push(context, route);
                      },
                      child: const Text('Aceptar'))
                ],
              );
            });
      } else {
        //Mostramos una alerta que nos diga que la contraseña es incorrecta
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('El usuaio y/o contraseña es incorrecta'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar'))
                ],
              );
            });
      }
    } else {
      //Mostramos una alerta que nos diga que el usuario no existe
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('El usuario no existe'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Aceptar'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
          child: Column(
            //Ponemos la imagen de la aplicacion

            children: [
              const Image(
                image: AssetImage('../assets/images/logo.png'),
                width: 200,
                height: 200,
              ),
              TextFormField(
                controller: usuarioController,
                decoration: const InputDecoration(
                    labelText: 'Digitar Usuario',
                    hintText: 'Nombre de usuario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: contrasenaController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Digitar Contraseña',
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.blue,
                    ),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              //Creamos los botones de iniciar sesion y registrarse
              ElevatedButton(
                onPressed: () {
                  iniciarSesion();
                },
                child: const Text('Iniciar Sesion'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  registrarse();
                },
                child: const Text('Registrarse'),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ), 
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ));
  }
}
