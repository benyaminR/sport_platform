import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';

import '../../container.dart';

class ImageSection extends StatelessWidget {

  final String name;
  final String thumbnail;
  final String id;

  const ImageSection({
    Key key,
    @required this.name,
    @required this.thumbnail,
    @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height1 = height - padding.top - padding.bottom;
    // Height (without status bar)
    final double height2 = height - padding.top;
    // Height (without status and toolbar)
    final double height3 = height - padding.top - kToolbarHeight;

    return SizedBox(
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
    );
  }
}
