import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';
import 'package:flutter_application_2/view/Screen/registerScreen.dart';

import '../compenent/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/387/387569.png")),
              loginCard(width, height, context)
            ],
          ),
        ),
      ),
    );
  }

  Card loginCard(double width, double height, BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.0), // Kartın kenar yuvarlatma değeri
      ),
      child: Container(
        width: width * 0.8,
        height: height * 0.4,
        decoration: BoxDecoration(
          color: const Color.fromARGB(153, 213, 213, 213),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                runSpacing: 10,
                children: [
                  TextInput(
                      labelText: "E-Mail",
                      hintText: "E-Mail",
                      iconData: Icons.person_2_sharp),
                  TextInput(
                      labelText: "Password",
                      hintText: "*******",
                      iconData: Icons.lock),
                  buttonGiris(),
                  textButtonKaydol(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Center textButtonKaydol(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
          },
          child: const Text("Hesabın yok mu? Kaydol!")),
    );
  }

  ElevatedButton buttonGiris() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      child: Center(
          child: Text(
        "Giriş Yap",
        style: TextStyle(color: Colors.black),
      )),
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.yellow, // Buton rengi
      ),
    );
  }
}
