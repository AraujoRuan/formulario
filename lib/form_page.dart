import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:formulario/firebase/firebase.dart';
import 'package:formulario/firebase/login.dart';

class FormPage extends StatefulWidget {
  final String title;
  const FormPage({Key? key, required this.title}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FirebaseClass firebaseClass = FirebaseClass();

  checkLogin(context) async {
    firebaseClass.auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLogin(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: firebaseClass.form,
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (nome) => firebaseClass.nome = nome!,
                decoration: InputDecoration(
                    hintText: 'Nome', helperText: 'Digite o nome aqui'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (matricula) =>
                    firebaseClass.matricula = int.parse(matricula!),
                decoration: InputDecoration(
                    hintText: 'Matrícula',
                    helperText: 'Digite a matrícula aqui'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (email) => firebaseClass.email = email!,
                decoration: InputDecoration(
                    hintText: 'Email', helperText: 'Digite a email aqui'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (senha) => firebaseClass.senha = senha!,
                decoration: InputDecoration(
                    hintText: 'Senha', helperText: 'Digite o senha aqui'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          firebaseClass.saveForm();
        },
        child: Text(
          'Salvar',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(fixedSize: Size(400, 50)),
      ),
    );
  }
}
