import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/community/domain/entity/community_media.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_bloc.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_event.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_state.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';



class PostAdd extends StatelessWidget {
  final _descriptionTextController = TextEditingController();
  var fileName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider.value(value: getIt<CommunityBloc>(),
          child: BlocConsumer<CommunityBloc,CommunityState>(
            listener: (context, state) {
              if(state is LoadedCommunitiesState){
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              if(state is LoadingCommunitiesState)
                return Center(child: CircularProgressIndicator(),);
              return Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 20.0, bottom: 0.0, right: 8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_back,
                                size: 28,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              "Neuer Beitrag",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.send,
                                size: 28,
                                color: Colors.white,
                              ),
                              onTap: (){
                                var description = _descriptionTextController.text;
                                if(fileName == "" || description == ""){
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Description or Media is Empty!")));
                                }else{
                                  getIt<CommunityBloc>().add(AddPostEvent(postData: CommunityPost(
                                    date: DateTime.now().toString(),
                                    username: "Benyamin Radmard",
                                    description: description,
                                    thumbnail: "Users/UnknownUserImage.png",
                                    comments: [],
                                    docID: "",
                                    likes: [],
                                    media: [
                                      CommunityMedia(
                                          thumbnail: "",
                                          mediaType: "image",
                                          source: fileName,
                                          creationDate: DateTime.now().toString(),
                                          viewCount: 0
                                      )
                                    ],
                                    shares: [],
                                  )));
                                }                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFF141416),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 400,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Media",
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 460,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async{
                                var file = await ImagePicker().getImage(source: ImageSource.camera);
                                fileName = 'Community/'+DateTime.now().toString();
                                BlocProvider.value(
                                    value: getIt<StorageBloc>()..add(
                                        UploadStorageDataEvent(
                                            data: StorageData(
                                              data: await file.readAsBytes(),
                                              path: fileName,
                                            )
                                        )
                                    )
                                );
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                size: 28,
                                color: Color(0xFF707070),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFF141416),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 400,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Beschreibung",
                            style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          TextField(
                            controller: _descriptionTextController,
                            decoration: InputDecoration(
                                hintText: "Hier schreiben...",
                                hintStyle: TextStyle(
                                    color: Color(0xFF707070),
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14.0)
                            ),
                            style: TextStyle(
                                color: Color(0xFFF),
                                // fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),)
    );
  }
}
