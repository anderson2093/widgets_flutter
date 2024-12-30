import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Laborum elit id labore ullamco excepteur cillum eiusmod sunt elit et exercitation.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Laboris voluptate proident dolor esse amet nisi incididunt ea excepteur fugiat exercitation.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Voluptate nulla laboris dolore sint ullamco sint sint duis aliquip esse non sit laborum voluptate.',
    'assets/images/3.png',
  )
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController(initialPage: 0);
  bool endReached = false;
  int activePage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            itemCount: slides.length,
            onPageChanged: (value) {
              if (value == slides.length - 1) {
                endReached = true;
              }
              setState(() {
                activePage = value;
              });
            },
            itemBuilder: (context, index) {
              final slide = slides[index];
              return _Slide(title: slide.title,caption: slide.caption,imageUrl: slide.imageUrl,);
            },
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir'))),
                              Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  slides.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        pageViewController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: activePage == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ))
              : const SizedBox()
        ]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final tileStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: tileStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
