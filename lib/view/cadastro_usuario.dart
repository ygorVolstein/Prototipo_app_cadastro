import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prototipo_app/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _nomecontroller = TextEditingController();
  TextEditingController _sobrenomecontroller = TextEditingController();
  TextEditingController _telefonecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _cpfcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mascaraTelefone = MaskTextInputFormatter(mask: '(##) # ####-####');
    var mascaraCPF = MaskTextInputFormatter(mask: '###.###.###-##');
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 70),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue,
              Colors.purple,
            ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/imagem_user.png",
                height: 50,
              ),
              Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'O campo "Nome" está incompleto';
                      }
                    },
                    controller: _nomecontroller,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'O campo "Sobrenome" está incompleto';
                      }
                    },
                    controller: _sobrenomecontroller,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Sobrenome",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.length < 11) {
                        return 'O campo "Telefone" está incompleto';
                      }
                    },
                    controller: _telefonecontroller,
                    autofocus: true,
                    inputFormatters: [mascaraTelefone],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hintText: '(00) 0 0000-0000'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'O campo "E-mail" está incompleto';
                      } else if (!value.contains('@')) {
                        return 'E-mail inválido';
                      }
                    },
                    controller: _emailcontroller,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        )),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.length < 11) {
                        return 'O  campo "CPF" está incompleto';
                      }
                    },
                    controller: _cpfcontroller,
                    autofocus: true,
                    inputFormatters: [mascaraCPF],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "CPF",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        hintText: '000.000.000-00'),
                  ),
                ],
              )),
              ElevatedButton(
                  onPressed: () {
                    Salvarusuario();
            
                  },
                  child: Text("SALVAR")
                  )
                  
            ],
          ),
        ),
      ),
    );
  }

  void Salvarusuario() {
    Usuario novoUsuario = Usuario(
        nome: _nomecontroller.text,
        sobrenome: _sobrenomecontroller.text,
        telefone: _telefonecontroller.text,
        email: _emailcontroller.text,
        cpf: _cpfcontroller.text);
    Instanciar(novoUsuario);
    print(novoUsuario.nome);
    print(novoUsuario.sobrenome);
    print(novoUsuario.telefone);
    print(novoUsuario.email);
    print(novoUsuario.cpf);
  }

  void Instanciar(Usuario usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CADASTRO_INFOS", json.encode(usuario.toJson()));
    ;
  }
}






