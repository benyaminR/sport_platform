import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';

class Login extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: BlocProvider.value(
        value: getIt<AuthenticationBloc>()..add(CheckAuthenticationEvent()),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is InitialAuthenticationState || state is ErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: new TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white
                        ),
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'username',
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white
                        ),
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: new TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          fillColor: Color(0xFFFFFFFF),
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
                      child: Text('Login'),
                      onPressed: () {
                        print(usernameController.value.text);
                        print(passwordController.value.text);
                        getIt<AuthenticationBloc>().add(SignInWithEmailEvent(
                              password: passwordController.value.text,
                              email: usernameController.value.text)
                      );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffe4572e)),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(300, 50)),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      child: Image(
                        image: AssetImage('assets/images/googlezeichen1.png'),
                        height: 50.0,
                        width: 50.0,
                      ),
                      onTap: () => getIt<AuthenticationBloc>()
                          .add(SignInWithGoogleEvent()),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                "Passwort vergessen?",
                                style: new TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                                textScaleFactor: 0.8,
                              ),
                              onTap: () => Navigator.of(context).pushNamed('/resetPassword'),
                            ),
                            Text(
                              "   |   ",
                              style: new TextStyle(
                                color: Color(0xFFFFFFFF),
                              ),
                              textScaleFactor: 0.8,
                            ),
                            GestureDetector(
                              child: Text(
                                "Hast Du schon kein Konto?",
                                style: new TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                                textScaleFactor: 0.8,
                              ),
                              onTap: () => {
                                Navigator.of(context).pushNamed('/register')
                              },
                            ),
                            // First, I'd try setting the Column's crossAxisAlignment value to stretch or wrapping the Container in an Expanded widget.
                            // This will try and force it to be the correct size. If that doesn't work, you'd need to look at the children of the container
                            // and determine which one is preventing it from being the correct size. You can also try a FittedBox, which can scale/clip contents in order to make them fit
                          ],
                        ),
                      ),
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
            if (state is SignedInState)
              Navigator.pushNamed(context, '/home');
            if (state is ErrorState)
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
              ));
          },
        ),
      ),
    );
  }
}
