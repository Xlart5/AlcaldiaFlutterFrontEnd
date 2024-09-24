import 'package:alcaldia_front/presentacion/providers/login_provider.dart';
import 'package:alcaldia_front/presentacion/screens/info/info_screen.dart';
import 'package:alcaldia_front/presentacion/screens/screens.dart';
import 'package:alcaldia_front/widgets/shared/field_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogIn2 extends StatelessWidget {
  const LogIn2({super.key});
  static const String link = '/LogInScreen2';

  @override
  Widget build(BuildContext context) {
    return const _Home();
  }
}

class _Home extends ConsumerWidget {
  final bool inicio = true;
  const _Home();

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final bool valorbool = ref.watch(loginProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.surface,
      body: Container(
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Transform(
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
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(-1.0, 1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          valorbool
                              ? const _Buttonloginregister(
                                  BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                  "Iniciar Sesion")
                              : Container(),
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          !valorbool ? "MePath" : "Registrarse",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35,
                              color: colors.onSurface),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: 500, child: InfoWidget());
                                },
                              );
                            },
                            icon: Icon(Icons.info_outline))
                      ],
                    ),
                  ),
                  //botones de loguin
                  const _ButtonsLoguin(),
                ],
              ),
            ),
            Expanded(
              child: Transform(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !valorbool
                            ? _Buttonloginregister(
                                BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                "Registrarse")
                            : Container()
                      ],
                    ),
                    // Voltea horizontalmente)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Buttonloginregister extends ConsumerWidget {
  final BorderRadiusGeometry border;
  final String text;

  const _Buttonloginregister(
    this.border,
    this.text,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: border,
          ))),
          onPressed: () {
            ref.read(loginProvider.notifier).update(
                  (state) => !state,
                );
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
            textScaler: TextScaler.linear(0.9),
          )),
    );
  }
}

class _ButtonsLoguin extends ConsumerWidget {
  const _ButtonsLoguin();

  @override
  Widget build(BuildContext context, ref) {
    final bool valor = ref.watch(loginProvider);
    final colors = Theme.of(context).colorScheme;
    return Flexible(
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
                          color: Colors.black
                              .withOpacity(0.2), // Color de la sombra
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
                  width: 250,
                  child: !valor
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FieldBox(
                              icons: Icons.people_alt_outlined,
                              style: 2,
                              borderWidth: 0,
                              color: Colors.white,
                              hintext: "ingrese usuario",
                              width: 200,
                              align: Alignment(1, 0.5),
                            ),
                            Divider(),
                            FieldBox(
                              icons: Icons.lock,
                              style: 2,
                              color: Colors.white,
                              hintext: "Contraseña",
                              width: 200,
                              borderWidth: 0,
                              align: Alignment(1, -0.5),
                            ),
                          ],
                        )
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FieldBox(
                              icons: Icons.people_alt_outlined,
                              style: 2,
                              borderWidth: 0,
                              color: Colors.white,
                              hintext: "ingrese email",
                              width: 200,
                              align: Alignment(1, 0.5),
                            ),
                            Divider(),
                            FieldBox(
                              icons: Icons.lock,
                              style: 2,
                              color: Colors.white,
                              hintext: "Contraseña",
                              width: 200,
                              borderWidth: 0,
                              align: Alignment(1, -0.5),
                            ),
                            Divider(),
                            FieldBox(
                              icons: Icons.lock,
                              style: 2,
                              color: Colors.white,
                              hintext: "Repita Contraseña",
                              width: 200,
                              borderWidth: 0,
                              align: Alignment(1, -0.5),
                            ),
                          ],
                        )),
            ],
          ),
          Positioned(
            right: 80,
            bottom: 150,
            child: SizedBox(
              width: 70,
              height: 70,
              child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    context.go(HomeScreenView.link);
                  },
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    color: colors.primary,
                  )),
            ),
          ),
          Positioned(
            right: 14,
            bottom: 10,
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
