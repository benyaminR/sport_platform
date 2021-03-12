import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';

class StorageTestWidget extends StatelessWidget {
  var currentPath = '/Test';
  var testData = '/Test/data.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            child: Center(
              child: BlocProvider.value(
                value: getIt<StorageBloc>(),
                child: BlocBuilder<StorageBloc,StorageState>(
                  builder: (context, state){
                    if(state is StorageLoading)
                      return CircularProgressIndicator();
                    if(state is StorageError)
                      return Text(state.msg);
                    if(state is GetDownloadUrlCompleted)
                      return Text(state.downloadUrl);
                    if(state is DeleteStorageDataCompleted)
                      return Text('deleted!');
                    if(state is UploadStorageDataCompleted)
                      return Text('uploaded!');
                    return Text('...');
                  },
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FlatButton(
                    onPressed: () async{
                      var file = await ImagePicker().getImage(source: ImageSource.camera);
                      var data = await file.readAsBytes();
                      getIt<StorageBloc>().add(UploadStorageDataEvent(data: StorageData(
                          data: data,
                          path: currentPath))
                      );
                    },
                    child: Text('Upload')
                ),
                FlatButton(
                    onPressed:()=> getIt<StorageBloc>().add(DeleteStorageDataEvent(path: currentPath)),
                    child: Text('Delete')
                ),
                FlatButton(
                    onPressed:()=> getIt<StorageBloc>().add(GetDownloadUrlEvent(path: currentPath)),
                    child: Text('Get Download URL')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
