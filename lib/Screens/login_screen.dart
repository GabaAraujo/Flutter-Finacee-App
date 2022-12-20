import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:managment/Screens/sign_up_screen.dart';
import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/login_screen.dart';
import 'package:managment/Screens/statistics.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/Screens/sign_up_screen.dart';
import 'package:managment/Screens/login_service.dart';
import 'package:managment/Screens/login_service.dart';
import 'package:managment/Screens/sign_up_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:managment/shared/routes.dart';


class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>
{

  bool? continueConnected = false; //variavel bool para vilidacao se esta logado

  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context){

      return Scaffold(
        body:
          Container
          (
            height: MediaQuery.of(context).size.height, //pega e ajusta de acordo com o tamanho do telefone
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30), //prenchimento limite para n bater nas bordas

            decoration: BoxDecoration
              (
                gradient:LinearGradient
                  (
                    begin: Alignment.topCenter,
                    end: Alignment(0.8, 1),
                    colors: <Color>
                        [
                          Color(0xffa5d6a7),
                          Color(0xffa5d4a3),
                          Color(0xffe0f2f1),
                          Color(0xffe0f2f1),
                       ],
                    )
              ),

            child: SingleChildScrollView( //pode escrolar o menu
              child: (
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:
                    [

                      Padding(padding:

                      EdgeInsets.only(
                        bottom: 25, //alinha no preenchimento da tela
                      ),


                        child :
                        Image.asset('images/cifrao.png',
                          height:125, //altura do icone
                        ),

                      ),


                      Text(
                        "Entrar",
                        textAlign: TextAlign.center,
                        style: TextStyle
                          (
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:FontWeight.bold,


                        ),
                      ),

                      Form //cria o formulario
                        (
                        key: _formKey,
                        child:
                        Column( //coluna do formulario
                          children: [ //tem o childrem

                            TextFormField //children possui coluna
                              (
                              controller: _mailInputController,
                              autofocus: true,
                              decoration: InputDecoration(//prorpierdades

                                labelText: "E-mail", //bota o email
                                labelStyle: TextStyle( //estilo do texto
                                  color: Colors.white,

                                ),
                                prefixIcon: Icon(
                                    Icons.mail_outline, //coloca o icone na caixa de texto
                                    color: Colors.white //cor do icone

                                ),
                                border: UnderlineInputBorder( //propriedade da borda
                                  borderSide: BorderSide(
                                    color: Colors.white, //coloca a cor em branco
                                  ),
                                ),

                                focusedBorder: UnderlineInputBorder( //propriedade da borda quando estiver em foco
                                  borderSide: BorderSide(
                                    color: Colors.white, //coloca a cor em branco
                                  ),
                                ),



                              ),


                            ),



                            TextFormField //children possui coluna
                              (
                              controller: _passwordInputController,
                              autofocus: true,
                              decoration: InputDecoration(//prorpierdades

                                labelText: "Senha", //bota o email
                                labelStyle: TextStyle( //estilo do texto
                                  color: Colors.white,

                                ),
                                prefixIcon: Icon(
                                    Icons.vpn_key_sharp, //coloca o icone na caixa de texto
                                    color: Colors.white //cor do icone

                                ),
                                border: UnderlineInputBorder( //propriedade da borda
                                  borderSide: BorderSide(
                                    color: Colors.white, //coloca a cor em branco
                                  ),
                                ),

                                focusedBorder: UnderlineInputBorder( //propriedade da borda quando estiver em foco
                                  borderSide: BorderSide(
                                    color: Colors.white, //coloca a cor em branco
                                  ),
                                ),




                              ),


                            ),




                          ],





                        ),


                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),// alinha para baixa

                      ),

                      GestureDetector(
                        onTap: () //quando apertado
                        {

                        }

                        ,
                        child:
                        Text(
                          "Esqueceu a senha?",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.right, //joga para direita do container
                        ),


                      ),//transforma qualquer widget em botao que estiver no filho

                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [

                          Checkbox(
                              value: this.continueConnected,
                              onChanged: (bool? NewState ) { //cria a variavel

                                              setState(() {



                                                this.continueConnected = NewState;
                                                print(this.continueConnected);

                                              });
                                        },

                          
                            checkColor: Colors.white,


                          ),

                          Text("Continuar conectado?",
                          style: TextStyle(color: Colors.white),
                          ),



                        ],



                      ),

                      ElevatedButton(onPressed: () {

                        //_doLogin();

                       // if()

                        Navigator.push(context,

                          MaterialPageRoute(
                            builder: (context) => Bottom(),

                          ),

                        );



                      },
                          child: Text("Login" , style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), //coloca o botao arredondado
                          ),
                        ),


                      ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Colors.white,
                      ),

                    ),

                      Text("Ainda não tem uma conta?\n",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                      ElevatedButton(onPressed: () {
                        Navigator.push(context,

                        MaterialPageRoute(
                            builder: (context) => SignUpPage(),

                        ),

                        );


                      },
                        child: Text("Cadastre-se" , style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), //coloca o botao arredondado
                          ),
                        ),


                      ),




                    ],



                  )


              ),






            )




          ),





      );
  }
}


