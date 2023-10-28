import 'package:flutter/material.dart';
import 'package:resumes_updater/add_new_service_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewServiceScreen())),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), minimumSize: const Size(50, 50)),
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text("Resumes Updater"),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  leading: const Icon(Icons.abc), // иконка сайта
                  title: const Text("Title"), // аккаунт
                  subtitle: const Text(
                      "Subtitle"), // ласт апдейт ор тайм то некст апдейт
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
