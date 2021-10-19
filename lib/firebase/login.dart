import 'package:flutter/material.dart';
import 'package:formulario/firebase/firebase.dart';
import 'package:formulario/form_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginPage createState() => LoginPage();

  FirebaseClass firebaseClass = FirebaseClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login do Aluno'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (nome) => firebaseClass.nome = nome.toString(),
              decoration: InputDecoration(
                  hintText: 'Nome', helperText: 'Digite o nome aqui'),
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
      floatingActionButton: ElevatedButton(
        onPressed: () => {
          firebaseClass.logout(),
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FormPage(title: 'Cadastrar novo Usuário')))
        },
        child: Text(
          'Logar',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
          400,
          50,
        )),
      ),
    );
  }
}
