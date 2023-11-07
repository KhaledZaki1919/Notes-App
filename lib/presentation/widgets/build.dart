import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/eddit.dart';
import 'package:notes/utils/Network/local/sqflite.dart';
import 'package:notes/utils/constants/custom_iconButton.dart';
import 'package:notes/utils/constants/custom_text.dart';

Widget BuildScreen(notes, set, sqlDb) => ListView.separated(
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditScreen(
                        notes: notes[index]['note'],
                        title: notes[index]['title'],
                        id: notes[index]['id'],
                        states: notes[index]['states'],
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          print(notes[index]['states']);
                        },
                        icon: Icon(Icons.ac_unit)),
                    CustomTextTitle(
                        text: "${notes[index]['title']}",
                        textOverflow: TextOverflow.ellipsis,
                        maxlines: 1,
                        fontsize: 25.0,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      width: 20.0,
                    ),
                    CustomTextP(
                      text: "${notes[index]['note']}",
                      fontsize: 17,
                    )
                  ],
                )
              ],
            ),
            trailing: CustomIconButton(
                function: () async {
                  int response = await sqlDb.deleteData(
                      "DELETE FROM notes WHERE id =${notes[index]['id']}");
                  if (response > 0) {
                    notes.removeWhere(
                        (element) => element['id'] == notes[index]['id']);

                    set(() {});
                  }
                },
                iconData: Icons.delete_outline_rounded),
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 2.0,
          color: Colors.grey[200],
        ),
      );
    },
    itemCount: notes.length);
