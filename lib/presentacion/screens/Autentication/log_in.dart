import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  static const String link = '/LogInScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return const Row(
      children: [
        SizedBox(
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
        )),
      ],
    );
  }
}

class _BodyLogIn extends StatelessWidget {
  const _BodyLogIn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        const SizedBox(
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
