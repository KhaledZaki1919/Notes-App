import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/homescreen.dart';
import 'package:notes/utils/Network/local/sqflite.dart';
import 'package:notes/utils/constants/custom_iconButton.dart';

class EditScreen extends StatefulWidget {
  final title;
  final notes;
  final states;
  final id;

  const EditScreen({super.key, this.title, this.notes, this.id, this.states});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var TitleTextControl = TextEditingController();
  var NotesTextControl = TextEditingController();
  String? states;
  GlobalKey<FormState> formstate = GlobalKey();
  SqlDb sqlDb = SqlDb();

  @override
  void initState() {
    TitleTextControl.text = widget.title;
    NotesTextControl.text = widget.notes;
    states = widget.states;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomIconButton(
                    function: () async {
                      int response = await sqlDb.updateData(
                          'UPDATE notes SET note ="${NotesTextControl.text}",title ="${TitleTextControl.text}" WHERE id =${widget.id}');
                      if (response > 0) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      }
                      return response;
                    },
                    iconData: Icons.edit_rounded),
                CustomIconButton(
                    function: () async {
                      int response = await sqlDb.updateData(
                          'UPDATE notes SET states ="Star" WHERE id =${widget.id}');
                      if (response > 0) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      }
                      return response;
                    },
                    iconData: Icons.star_border_rounded),
                CustomIconButton(
                    function: () async {
                      int response = await sqlDb.updateData(
                          'UPDATE notes SET states ="archive" WHERE id =${widget.id}');
                      if (response > 0) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      }
                      return response;
                    },
                    iconData: Icons.folder_outlined),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Title'),
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
    );
  }
}
