import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/utils/Network/local/sqflite.dart';
import 'package:notes/utils/constants/custom_iconButton.dart';
import 'package:notes/utils/cubit/cubit.dart';
import 'package:notes/utils/cubit/state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (BuildContext context, NotesState state) {},
        builder: (BuildContext context, NotesState state) {
          final cubit = NotesCubit.get(context);
          var TitleTextControl = TextEditingController();
          var NotesTextControl = TextEditingController();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.Title[cubit.SelectIndex],
                style: const TextStyle(color: Colors.black),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            child: Container(
                              width: 50,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomIconButton(
                                  function: () async {
                                    int response = await sqlDb.insertData(
                                        'INSERT INTO notes (`note`,`title`,`states`) VALUES ("${NotesTextControl.text}","${TitleTextControl.text}","states")');
                                    //return response;
                                    print("response +++++++");
                                    print(response);
                                    if (response > 0) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()),
                                          (route) => false);
                                    }
                                  },
                                  iconData: Icons.add_box_outlined),
                              // CustomIconButton(
                              //     function: () {},
                              //     iconData: Icons.star_border_rounded),
                              // CustomIconButton(
                              //     function: () {},
                              //     iconData: Icons.folder_outlined),
                              // CustomIconButton(
                              //     function: () {},
                              //     iconData: Icons.delete_outline_rounded),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextField(
                            decoration:
                                const InputDecoration(hintText: 'Title'),
                            style: const TextStyle(color: Colors.black),
                            controller: TitleTextControl,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                  hintText: 'Notes', border: InputBorder.none),
                              style: const TextStyle(color: Colors.black),
                              controller: NotesTextControl,
                              keyboardType: TextInputType.text,
                              scrollPadding: const EdgeInsets.all(20.0),
                              maxLines: null,
                              minLines: null,
                              expands: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.SelectIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  cubit.onDestinationSelected(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star_border_rounded), label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.folder_outlined), label: 'Archived'),
                ]),
            body: cubit.Screen[cubit.SelectIndex],
          );
        },
      ),
    );
  }
}
