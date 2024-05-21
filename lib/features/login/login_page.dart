import 'package:flutter/material.dart';
import 'package:news_app/features/news/news_list_page.dart';

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
            const Text(
              "E X P R E S S N E W S",
              style: TextStyle(
                color: Color.fromARGB(255, 51, 160, 54),
                fontWeight: FontWeight.normal,
                fontSize: 30.0,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {},
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
