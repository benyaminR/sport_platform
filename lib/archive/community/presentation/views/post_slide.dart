import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/archive/community/domain/entity/community_media.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';

class PostSlide extends StatelessWidget {

  final List<CommunityMedia> medias;

  PostSlide({@required this.medias});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CarouselSlider(
          options: CarouselOptions(
            // height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: false,
            enableInfiniteScroll: false,
          ),
          items: medias.map((media) =>
              BlocProvider.value(
                value:getIt<StorageBloc>()..add(GetDownloadUrlEvent(path: media.source)),
                child: BlocBuilder<StorageBloc,StorageState>(
                  builder: (context, state) {
                    if(state is GetDownloadUrlCompleted)
                      return Container(
                        child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: FadeInImage(
                              placeholder: AssetImage('assets/images/transparent.png'),
                              image: NetworkImage(state.downloadUrl,),
                                fit: BoxFit.cover,
                                height: 300,
                                width: MediaQuery.of(context).size.width
                            )
                        ),
                      );
                    if(state is StorageLoading)
                      return Center(child: CircularProgressIndicator(),);
                    if(state is StorageError)
                      return Center(child: Text(state.msg),);
                    return Container();
                  },
                ),
              )

          ).toList(),
        );
      },
    );
  }

}
