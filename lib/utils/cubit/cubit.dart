import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/pages/archivedpage.dart';
import 'package:notes/presentation/pages/favoritepage.dart';
import 'package:notes/presentation/pages/homepage.dart';
import 'package:notes/utils/cubit/state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NoteslnitiatState());
  static NotesCubit get(context) => BlocProvider.of(context);
  int SelectIndex = 0;
  List<String> Title = [
    'Notes',
    'Favorite',
    'Archived',
  ];
  List<Widget> Screen = [HomePage(), FavoritePage(), ArchivePage()];
  void onDestinationSelected(index) {
    SelectIndex = index;
    emit(NotesBottomNavState());
  }
}
