import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_library_event.dart';

part 'users_library_state.dart';

class UsersLibraryBloc extends Bloc<UsersLibraryEvent, UsersLibraryState> {
  @override
  UsersLibraryState get initialState => InitialUsersLibraryState();

  @override
  Stream<UsersLibraryState> mapEventToState(UsersLibraryEvent event) async* {
    // TODO: Add your event logic
  }
}
