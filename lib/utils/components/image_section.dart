import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';

import '../../container.dart';

class CourseListViewCard extends StatelessWidget {

  final String name;
  final String thumbnail;
  final String id;

  const CourseListViewCard({
    Key key,
    @required this.name,
    @required this.thumbnail,
    @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return InkWell(
      onTap:()=> Navigator.of(context).pushNamed("/home/personal/courseDetailView",arguments: id),
      child: Container(
        child: SizedBox(
          width: height3 * 0.36,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: height3 * 0.024),
                child: BlocProvider.value(
                    value: getIt<StorageBloc>()..add(GetDownloadUrlEvent(path: thumbnail)),
                    child:BlocBuilder<StorageBloc,StorageState>(
                      builder: (context, state) {
                        if(state is StorageLoading)
                          return CircularProgressIndicator();
                        if(state is GetDownloadUrlCompleted)
                          return Container(
                            height: height3 * 0.18,
                            decoration: new BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.downloadUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          );
                        return Container();
                      },
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height3 * 0.012),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height3 * 0.024,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: height3 * 0.009,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: height3 * 0.009,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: height3 * 0.009,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
