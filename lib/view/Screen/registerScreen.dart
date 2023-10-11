import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';

import '../compenent/textField.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.yellow,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [registerCard(width, height, context)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card registerCard(double width, double height, BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.0), // Kartın kenar yuvarlatma değeri
      ),
      child: Container(
        width: width * 0.8,
        height: height * 0.6,
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
                      labelText: "İsim",
                      hintText: "İsim",
                      iconData: Icons.person_2_rounded),
                  TextInput(
                      labelText: "Soyisim",
                      hintText: "Soyisim",
                      iconData: Icons.person_2_rounded),
                  TextInput(
                      labelText: "E-Mail",
                      hintText: "tuna@ornek.com",
                      iconData: Icons.email_rounded),
                  TextInput(
                      labelText: "Şifre",
                      hintText: "*****",
                      iconData: Icons.lock),
                  ElevatedButton(
                    onPressed: () {
                      //Kayıt olma işlemleri buraya ekleyebiliriz.
                      _dialogBuilder(context);
                    },
                    child: const Center(child: Text("Kayit Ol")),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ProjectColors.yellow, // Buton rengi
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Başarili'),
          content: const Text("Kayit işleminiz başariyla gerçekleşti"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Giriş Yap'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}
