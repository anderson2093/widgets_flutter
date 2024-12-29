import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios_new_rounded), onPressed: () {}),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarms_rounded),
                label: const Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_time_filled),
                label: Text("Filled Icon")),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.pets_rounded),
                label: Text('Outline Icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.file_download),
                label: const Text('Text Icon')),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.people_outline_outlined)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.vape_free_rounded),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: WidgetStatePropertyAll(Colors.white)),
            ),

            // Custom Button
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Satisfactorio',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
