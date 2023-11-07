import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/eddit.dart';
import 'package:notes/presentation/widgets/build.dart';
import 'package:notes/utils/Network/local/sqflite.dart';
import 'package:notes/utils/constants/custom_iconButton.dart';
import 'package:notes/utils/constants/custom_text.dart';
import 'package:notes/utils/cubit/cubit.dart';

class ArchivePage extends StatefulWidget {
  ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePage();
}

class _ArchivePage extends State<ArchivePage> {
  GlobalKey<FormState> formstate = GlobalKey();
  SqlDb sqlDb = SqlDb();
  bool islodung = true;
  List notes = [];
  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM notes WHERE states='archive'");
    notes.addAll(response);
    //setState(() {});
    islodung = false;
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = NotesCubit.get(context);
    return islodung == true
        ? const Center(child: Text('Loding....'))
        : BuildScreen(notes, setState, sqlDb);
  }
}
