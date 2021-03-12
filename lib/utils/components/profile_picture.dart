import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';

class ProfilePicture extends StatelessWidget {

  final String url;
  final double size;

  ProfilePicture({@required this.url, @required this.size});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: Color(0xFFE4572E),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE4572E),
              blurRadius: 0.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: BlocProvider.value(
            value: getIt<StorageBloc>()..add(GetDownloadUrlEvent(path: url)),
            child:BlocBuilder<StorageBloc,StorageState>(
          builder: (context, state) {
            if(state is StorageLoading)
              return CircularProgressIndicator();
            if(state is GetDownloadUrlCompleted)
              return CircleAvatar(
                backgroundImage: NetworkImage(state.downloadUrl),
                //20.0
                radius: size,
              );
            return Container();
          },
        )),
      ),
    );
  }
}
