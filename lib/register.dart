import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider<AuthenticationBloc>(
        create: (context) =>
        getIt<AuthenticationBloc>()..add(CheckAuthenticationEvent()),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is InitialAuthenticationState || state is ErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Registrieren",
                      style: new TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'name',
                          hintStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          labelStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'e-mail adresse',
                          hintStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          labelStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          labelStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                      child: Text('Registrieren'),
                      onPressed: () => getIt<AuthenticationBloc>().add(
                          SignInWithEmailEvent(
                              password: 'password',
                              email: 'benyaminradmard84@gmail.com')),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffe4572e)),
                        minimumSize:
                        MaterialStateProperty.all<Size>(Size(300, 50)),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              );
            } else if (state is SigningInState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SignedInState) {
              return Container();
            }
            return Container();
          },
          listener: (context, state) {
            if (state is SignedInState) Navigator.pushNamed(context, '/home');
            if (state is ErrorState)
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Wrong password or email'),
              ));
          },
        ),
      ),
    );
  }
}
