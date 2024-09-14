import 'package:alcaldia_front/widgets/Buttons/outlined_button.dart';
import 'package:alcaldia_front/widgets/shared/field_box.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  static const String link = '/LogInScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.app_registration_outlined),
          )
        ],
        title: const _TitleAppbar(),
      ),
      body: const _BodyLogIn(),
    );
  }
}

class _TitleAppbar extends StatelessWidget {
  const _TitleAppbar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        const SizedBox(
          width: 80,
          child: Image(
            image: AssetImage("assets/logo1.png"),
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Text(
          "Ingresar",
          textAlign: TextAlign.center,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.w500),
        )),
      ],
    );
  }
}

class _BodyLogIn extends StatelessWidget {
  const _BodyLogIn();

  @override
  Widget build(BuildContext context) {
    
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image(
                  image: AssetImage("assets/loginMap.png"),
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 50,
                ),
                FieldBox(
                  style: 0,
                  color: Colors.white,
                  hintext: "Ingrese nombre de usuario",
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                FieldBox(
                  style: 0,
                  color: Colors.white,
                  hintext: "Ingrese Contraseña",
                  width: double.infinity,
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: Outlinedbutton(
                      text: "Ingresar",
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=1080,fit=crop/m6LJ4Lz1DoFjjNNB/design-sem-nome-6-m5KblpervJHJo1pR.jpg")),
        )
      ],
    );
  }
}
