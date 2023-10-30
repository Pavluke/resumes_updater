import 'package:flutter/material.dart';
import 'package:resumes_updater/webview_screen.dart';

class AddNewServiceScreen extends StatelessWidget {
  const AddNewServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: const Text('Новый сервис'),
        ),
        body: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                                  //link: "https://hh.ru/account/login/",
                                  link:
                                      "https://spb.hh.ru/?hhtmFrom=account_login",
                                ))),
                    child: const ListTile(
                      title: Text("HeadHunter"),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                                  link: "https://www.superjob.ru/auth/login/",
                                ))),
                    child: const ListTile(
                      title: Text("SuperJob"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
