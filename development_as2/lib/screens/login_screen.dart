import 'package:development_as2/screens/olvidar_contrasena_screen.dart';
import 'package:development_as2/screens/registrase_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Color.fromARGB(255, 132, 169, 232),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: -30,
                      top: -40,
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ))),
                  Positioned(
                      right: -20,
                      top: -50,
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ))),
                  Positioned(
                      left: 10,
                      bottom: -50,
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ))),
                  Positioned(
                      right: 20,
                      bottom: 120,
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ))),
                  Positioned(
                      top: 90,
                      left: 30,
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ))),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.1),
                width: double.infinity,
                child: const Icon(Icons.person_pin,
                    size: 100, color: Colors.white),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 340),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 25,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Iniciar Sesion',
                            style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Correo Electronico',
                                  prefixIcon: Icon(
                                    Icons.alternate_email_outlined,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Contraseña',
                                  prefixIcon: Icon(Icons.lock_outline,
                                      color: Colors.blueAccent),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                disabledColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const SizedBox(
                                    width: 120,
                                    height: 40,
                                    child: Center(child: Text('Ingresar'))),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () {
                      //Redirigimos al registro
                      final route = MaterialPageRoute(
                          builder: (context) => const RegistrarseScreen());
                      Navigator.push(context, route);
                    },
                    color: null,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Crear una cuenta',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  MaterialButton(
                      onPressed: () {
                                              final route = MaterialPageRoute(
                          builder: (context) => const OlvideContrasenaScreen());
                      Navigator.push(context, route);
                      },
                      color: null,
                      textColor: const Color.fromARGB(255, 127, 197, 255),
                      child: const Text('¿Olvidaste tu contraseña?'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
