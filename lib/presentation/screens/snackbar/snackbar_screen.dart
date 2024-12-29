import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snakback = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Ex adipisicing in Lorem esse ut labore voluptate culpa esse. Culpa esse occaecat mollit Lorem laboris occaecat. Qui proident id in amet ad duis. Anim sint aute eiusmod eu pariatur exercitation laborum sit ex exercitation Lorem magna est. Est laboris in dolore ipsum sint ad dolore nostrud.'),
        actions: [
          TextButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Cancelar')),
            FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Ut excepteur nulla mollit ipsum voluptate veniam consectetur.')
                ]);
              },
              child: const Text('Mostrar diálogo')),
          FilledButton.tonal(
              onPressed: () => openDialog(context), child: const Text('Mostrar diálogo'))
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context)),
    );
  }
}
