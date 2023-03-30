import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fstore/screens/home_screen.dart';
import 'package:fstore/utils/firestore_utils.dart';
import 'package:fstore/utils/snack_bar.dart';
import 'package:fstore/utils/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fstore/utils/user_utils.dart';
import 'package:fstore/models/user.dart' as models;

class EnterScreen extends StatefulWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EnterScreenState();
}

class EnterScreenState extends State<EnterScreen> {
  bool isHiddenPassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Вход в приложение')
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: 
                      TextFormField(
                        controller: loginController,
                        autocorrect: false,
                        validator: (value) {
                          if (value == "") {
                            return "Поле должно быть заполнено.";
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), 
                            hintText: "Почта"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        autocorrect: false,
                        controller: passwordController,
                        obscureText: isHiddenPassword,
                        validator: (value) => value != null && value.length < 8
                          ? 'Поле должно быть заполнено.'
                          : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(), 
                            hintText: "Пароль",
                            suffix: InkWell(
                              onTap: togglePasswordView,
                              child: Icon(
                                isHiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      FireBaseUtils.instance
                          .authLoginAndPassword(
                              loginController.text, passwordController.text)
                          .then((status) {
                        if (status.isSuccess) {
                          SnackBarService.showSnackBar(context, "Вы успешно вошли.", true);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                        } else {
                          SnackBarService(status.errorMessage!, context);
                        }
                      });
                    },
                    child: const Text("Войти")),
                ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;
                      FireBaseUtils.instance
                          .register(
                              loginController.text, passwordController.text)
                          .then((status) {
                        if (status.isSuccess) {
                          SnackBarService.showSnackBar(context, "Вы успешно зарегистрировались.", true);
                        }
                        else {
                          SnackBarService(status.errorMessage!, context);
                        }
                      });
                    },
                    child: const Text("Зарегистрироваться"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
