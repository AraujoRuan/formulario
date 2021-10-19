import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseClass {
  int matricula = 0;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String nome;
  late String email;
  late String senha;
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  saveForm() {
    form.currentState!.save();
    Map<String, dynamic> pessoa = {
      'nome': nome,
      'matricula': matricula,
      'created.at': DateTime.now(),
    };
    print(pessoa);
    auth
        .createUserWithEmailAndPassword(email: this.email, password: this.senha)
        .then((value) {
      String userUid = value.user!.uid;
      firestore.collection('aluno').doc(userUid).set(pessoa);
    }).catchError((onError) => (onError));
  }

  logout() {
    auth.signOut();
  }
}
