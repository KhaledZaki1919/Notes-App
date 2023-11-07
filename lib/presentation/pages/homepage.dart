import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/eddit.dart';
import 'package:notes/presentation/widgets/build.dart';
import 'package:notes/utils/Network/local/sqflite.dart';
import 'package:notes/utils/constants/custom_iconButton.dart';
import 'package:notes/utils/constants/custom_text.dart';
import 'package:notes/utils/cubit/cubit.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formstate = GlobalKey();
  SqlDb sqlDb = SqlDb();
  bool islodung = true;
  List notes = [];
  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM notes WHERE states='states'");
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
    return islodung == true
        ? const Center(child: Text('Loding....'))
        : BuildScreen(notes, setState, sqlDb);
  }
}
