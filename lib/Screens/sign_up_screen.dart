import 'package:flutter/material.dart';
import 'package:managment/Screens/login_service.dart';
import 'package:managment/Screens/sign_up_service.dart';


import 'dart:convert';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool? showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffa5d6a7),
              Color(0xffa5d4a3),
              Color(0xffe0f2f1),
              Color(0xffe0f2f1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          if (value.length < 6) {
                            return "Digite um nome maior";
                          }
                          else {
                            return null;
                          }
                        }
                      },
                      controller: _nameInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          if (value.length < 5) {
                            return "Este email parece curto demais";
                          }
                          else if (!value.contains("@")) {
                            return "Esse e-mail está meio estranho, não?";
                          }
                          else {
                            return null;
                          }
                        }
                      },


                      controller: _mailInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          if (value.length < 5) {
                            return "Esta senha esta muito curta";
                          }
                          else {
                            return null;
                          }
                        }
                      },
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    (this.showPassword == false)
                        ? TextFormField(
                      validator: (value) {
                        if (value != _passwordInputController.text) {
                          return "As senhas devem ser iguais";
                        }
                        return null;
                      },
                      controller: _confirmInputController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Confirme a Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          onChanged: (bool? newValue) {
                            setState(() {
                              this.showPassword = newValue;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(
                          "Mostrar senha",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // ignore: deprecated_member_use


              ElevatedButton(onPressed: () {
                _doSignUp();
              },
                child: Text(
                  "Cadastrar", style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), //coloca o botao arredondado
                  ),
                ),

              ),


            ],


          ),
        ),
      ),
    );
  }


  void _doSignUp() {
    if (_formKey.currentState?.validate() != null) {
      SignUpService().signUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
    } else {
      print("invalido");
    }


    void _doLogin() async {
      if (_formKey.currentState?.validate() != null) {
        LoginService()
            .login(_mailInputController.text, _passwordInputController.text);
      } else {
        print("invalido");
      }
    }
  }

/*
     LoginModel newUser = LoginModel(
       name: _nameInputController.text,
       mail: _mailInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
     );

     _saveUser(newUser);
  }


  // ignore: unused_element
  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
  }
   */


}