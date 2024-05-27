import 'package:flutter/material.dart';
import 'package:news_app/features/login/controller/login_view_model.dart';
import 'package:news_app/features/news/news_list_page.dart';
import 'package:provider/provider.dart';

import '../../news/controller/news_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<NewsProvider>(
              builder: (context, value, _) {
                return MaterialButton(
                  onPressed: () {
                    value.buttonPress();
                  },
                  child: Text(value.buttonText),
                );
              },
            ),
            Consumer<LoginProvider>(builder: (context, state, _) {
              return Column(
                children: [
                  Text(
                    "E X P R E S S N E W S ${state.counter}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 51, 160, 54),
                      fontWeight: FontWeight.normal,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              );
            }),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<LoginProvider>(context, listen: false)
                          .increment();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 102, 102, 102)),
                    ),
                    child: const Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Provider.of<LoginViewModel>(context, listen: false)
                      //     .decrement();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewsListPage()),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 51, 160, 54)),
                    ),
                    child: const Text(
                      "Sign in as guest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
