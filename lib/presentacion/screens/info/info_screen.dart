import 'package:alcaldia_front/presentacion/providers/login_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoWidget();
  }
}

class _InfoWidget extends ConsumerWidget {
  final CarouselSliderController _controller = CarouselSliderController();
  _InfoWidget();

  @override
  Widget build(BuildContext context, ref) {
    final index1 = ref.watch(infoProvider);
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _InfoScreenText(
                      colors: colors,
                      text:
                          "La Alcaldía de Cochabamba te presenta MePath. Una innovadora aplicación diseñada para recopilar datos sobre las rutas que utilizan estudiantes en sus desplazamientos diarios hacia y desde la universidad. Esta herramienta permite a los usuarios registrar sus trayectos, proporcionando información clave sobre los caminos más frecuentados y las condiciones de acceso. El objetivo principal de esta aplicación es analizar estos datos para mejorar la infraestructura vial y la eficiencia de los accesos en las rutas más empleadas, optimizando el tránsito y facilitando una movilidad más segura y rápida para la comunidad estudiantil y contribuir al desarrollo urbano sostenible de la ciudad",
                      titulo: 'Introduccion',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _InfoScreenText(
                      colors: colors,
                      text:
                          "Para usar MePath debes registrarte con tu cuenta asociada a tu dispositivo. Una vez que hagas esto, te preguntaremos por el medio de transporte que emplearás y cuánto tiempo sueles emplear en ese desplazamiento.Después de esto solo queda que presiones el boton ¡Empezar! y la aplicación comenzará a registrar tu recorrido en segundo plano sin provocarte ninguna molestia.",
                      titulo: 'Modo de Uso',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _InfoScreenText(
                      colors: colors,
                      text:
                          "Una vez llegues a tu destino, simplemente presiona ¡LLegué! La aplicación te pedirá que confirmes que deseas pararla y volverás a la pantalla anterior.¡Muchas gracias por usar MePath y auidarnos a hacer de Cochabamba una ciudad mejor!",
                      titulo: 'Modo de Uso',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _InfoScreenText(
                      colors: colors,
                      text:
                          "Al utilizar esta aplicación, se informa a los usuarios que la Alcaldía de Cochabamba no recoge ningún dato personal. Únicamente se recopilan datos GPS de las rutas seguidas por los estudiantes para fines de análisis de movilidad. Esta información es anónima y se utiliza exclusivamente para mejorar la eficiencia de los accesos y rutas más empleadas en la ciudad. La privacidad y seguridad de los usuarios son prioridades, y en ningún momento se almacenan o comparten datos personales que puedan identificar a los individuos.",
                      titulo: 'Disclaimer de privacidad',
                    ),
                  )
                ],
                carouselController: _controller,
                options: CarouselOptions(
                  initialPage: 0,
                  viewportFraction: 1,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.25,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    ref.read(infoProvider.notifier).state = index;
                  },
                )),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(
                    index,
                  ),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(index1 == index ? 0.9 : 0.4),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}

class _InfoScreenText extends StatelessWidget {
  const _InfoScreenText({
    super.key,
    required this.colors,
    required this.text,
    required this.titulo,
  });

  final ColorScheme colors;
  final String text;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: TextStyle(fontSize: 28, color: colors.primary),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
