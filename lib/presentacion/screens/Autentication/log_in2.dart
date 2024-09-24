import 'package:alcaldia_front/widgets/shared/field_box.dart';
import 'package:flutter/material.dart';

class LogIn2 extends StatelessWidget {
  const LogIn2({super.key});
  static const String link = '/LogInScreen2';

  @override
  Widget build(BuildContext context) {
    return const _Home();
  }
}

class _Home extends StatelessWidget {
  final bool inicio = true;
  const _Home();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Transform(
                  alignment: Alignment
                      .center, // Alinea la imagen desde el centro para evitar que desaparezca
                  transform: Matrix4.identity()
                    ..scale(-1.0, 1.0), // Voltea horizontalmente
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/wave3.png"),
                      fit: BoxFit.cover,
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(-1.0, 1.0),
                            child: inicio
                                ? const _Buttonloginregister(
                                    BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    "Iniciar Sesion")
                                : Container()),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        inicio ? "Ingresar" : "Registrar",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 35,
                            color: colors.onSurface),
                      ),
                      //botones de loguin
                      const _ButtonsLoguin(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Boton de registrarse
          Transform(
              alignment: Alignment
                  .center, // Alinea la imagen desde el centro para evitar que desaparezca
              transform: Matrix4.identity()
                ..scale(-1.0, 1.1), // Voltea horizontalmente
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/wave2.png"),
                        fit: BoxFit.cover)),
                child: Transform(
                  alignment: Alignment
                      .center, //   Alinea la imagen desde el centro para evitar que desaparezca
                  transform: Matrix4.identity()..scale(-1.0, 1.0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Buttonloginregister(
                          BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          "Registrarse")
                    ],
                  ),
                  // Voltea horizontalmente)
                ),
              )),
        ],
      ),
    );
  }
}

class _Buttonloginregister extends StatelessWidget {
  final BorderRadiusGeometry border;
  final String text;
  const _Buttonloginregister(
    this.border,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: border,
          ))),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
            textScaler: TextScaler.linear(0.9),
          )),
    );
  }
}

class _ButtonsLoguin extends StatelessWidget {
  const _ButtonsLoguin();

  @override
  Widget build(BuildContext context) {
    final bool valor = true;
    final colors = Theme.of(context).colorScheme;
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.2), // Color de la sombra
                        spreadRadius: 2, //
                        blurRadius: 10, //
                        offset: const Offset(
                            0, 5), // Desplazamiento de la sombra (x, y)
                      ),
                    ],
                    border: Border.all(color: Colors.black, width: 0),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                width: 300,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FieldBox(
                      icons: Icons.people_alt_outlined,
                      style: 2,
                      borderWidth: 0,
                      color: Colors.white,
                      hintext: "ingrese usuario",
                      width: 230,
                      align: Alignment(1, 0.5),
                    ),
                    Divider(),
                    FieldBox(
                      icons: Icons.lock,
                      style: 2,
                      color: Colors.white,
                      hintext: "Contraseña",
                      width: 230,
                      borderWidth: 0,
                      align: Alignment(1, -0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 150,
            bottom: 150,
            child: SizedBox(
              width: 70,
              height: 70,
              child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    color: colors.primary,
                  )),
            ),
          ),
          Positioned(
            right: 14,
            bottom: 30,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password",
                )),
          )
        ]),
      ),
    );
  }
}
