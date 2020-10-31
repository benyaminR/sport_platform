import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthenticationBloc>(
        create: (context)=> getIt<AuthenticationBloc>()..add(CheckAuthenticationEvent()),
        child: BlocConsumer<AuthenticationBloc,AuthenticationState>(
          builder: (context,state){
            if(state is InitialAuthenticationState || state is ErrorState){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(child: Text('Google'),onPressed: ()=> getIt<AuthenticationBloc>().add(SignInWithGoogleEvent()),),
                    ElevatedButton(child: Text('E-Mail'),onPressed: ()=> getIt<AuthenticationBloc>().add(SignInWithEmailEvent(password: 'password',email: 'benyaminradmard84@gmail.com')),),
                    // ElevatedButton(child: Text('Facebook'),onPressed: ()=> getIt<AuthenticationBloc>().add(SignInWithFacebookEvent()),),
                    //ElevatedButton(child: Text('Apple'),onPressed: ()=> getIt<AuthenticationBloc>().add(SignInWithAp()),),
                    ElevatedButton(child: Text('Anonymous'),onPressed: ()=> getIt<AuthenticationBloc>().add(SignInAnonymouslyEvent()),),
                  ],
                ),
              );
            }else if(state is SigningInState){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is SignedInState){
              return Container();
            }
            return Container();
          },
          listener: (context,state){
            if(state is SignedInState)
              Navigator.pushNamed(context, '/home');
          },
        ),
      ),
    );
  }
}

