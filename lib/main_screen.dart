import 'package:flutter/material.dart';
import 'package:resumes_updater/add_new_service_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
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
                  leading: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Text(
                        'hh',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      CircularProgressIndicator(
                        value: 0.5,
                        color: Colors.red,
                        backgroundColor: Colors.red.withOpacity(0.2),
                      )
                    ],
                  ),
                  title: const Text("Title"),
                  subtitle: const Text("Subtitle"),
                ),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  leading: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Text(
                        'SJ',
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      CircularProgressIndicator(
                        value: 0.5,
                        color: Colors.green,
                        backgroundColor: Colors.green.withOpacity(0.2),
                      )
                    ],
                  ), //сайта
                  title: const Text("Title"),
                  subtitle: const Text("Subtitle"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
