import 'package:flutter/material.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';

import '../container.dart';

class CloudFunctionsTest extends StatelessWidget {
  final textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getIt<AuthenticationBloc>().add(SignInWithGoogleEvent());

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            child: Center(child: Text('result')),
          ),
          TextField(
            controller: textFieldController,
          ),
          FlatButton(
              onPressed: (){},
              child: Text('Execute')
          )
        ],
      ),
    );
  }
}
