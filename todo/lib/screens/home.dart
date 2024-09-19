import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';
import '../providers/note_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/note_searchh delegate.dart';

class first_screen extends StatefulWidget {


  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  Future<void> load_notes(noteprovider noteProvider) async {
    final prefs = await SharedPreferences.getInstance();
    String notes_text = prefs.getString("notes")??"";
    if(notes_text.isNotEmpty)
      {for(note_model item in (jsonDecode(notes_text) as List<note_model>)){
      noteProvider.addnote(item);
    }}
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<theme_provider>(context);
    final userprovider = Provider.of<Userprovider>(context);
    final noteProvider = Provider.of<noteprovider>(context);
    load_notes(noteProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        { String title = "";
          String content = "";
          showDialog(context: context, builder: (context)=> AlertDialog(
            title: Text("Add note"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onChanged:(value)
                {
                  title = value;
                },
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    labelText: "content",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                    )
                ),
                onChanged:(value)
                {
                  content = value;
                },
              ),

            ],

          ),
            actions: [
              TextButton(onPressed:(){
                noteProvider.addnote(
                  note_model(title: title, content: content)
                );
                Navigator.pop(context);
              }, child: Text("Add")),
              TextButton(onPressed:(){Navigator.pop(context);}, child: Text("Cancel")),

            ],

        ));},
        child: Icon(Icons.add),

      ),
      appBar: AppBar(
        title: Text("Todo", style: TextStyle(letterSpacing: 2),),
        centerTitle: true,
        shape: LinearBorder(side: BorderSide(width: 2, color: Colors.black), bottom: LinearBorderEdge(size: 0.5)),
        actions: [
          IconButton(
              onPressed:()
              {
                showSearch(context: context, delegate: NoteSerachDelegate());
              },
              icon: Icon(Icons.search_rounded))
        ],

      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,),
            ListTile(
              trailing: CupertinoSwitch(
                value: themeprovider.islighttheme,
                onChanged:(value)
                {
                  themeprovider.toggleTheme();
                },
              ),
            ),
          ],
        ),

      ),
      body: Center(
        child: ListView.builder(
          itemCount: noteProvider.notes.length,
           itemBuilder: (context,index)
           {
             return Dismissible(
               key: ValueKey(noteProvider.notes[index]),
               onDismissed: (direction)
               {
                 noteProvider.deletenote(index);
               },
               child: ListTile(
                 onTap: (){
                 String title = noteProvider.notes[index].title;
                 String content = noteProvider.notes[index].content;
                 showDialog(context: context, builder: (context)=> AlertDialog(
                   title: Text("Edit note"),
                   content: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       TextField(
                         decoration: InputDecoration(
                             labelText: "Title",
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                             )
                         ),
                         onChanged:(value)
                         {
                           title = value;
                         },
                         controller: TextEditingController(text: title),
                       ),
                       SizedBox(height: 10,),
                       TextField(
                         decoration: InputDecoration(
                             labelText: "content",
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                             )
                         ),
                         onChanged:(value)
                         {
                           content = value;
                         },
                         controller: TextEditingController(text: content),
                       ),

                     ],

                   ),
                   actions: [
                     TextButton(onPressed:(){
                       noteProvider.editnote(index, note_model(title: title,content: content));
                       Navigator.pop(context);
                     }, child: Text("Edit")),
                     TextButton(onPressed:(){Navigator.pop(context);}, child: Text("Cancel")),

                   ],

                 ));},
                 title: Text(noteProvider.notes[index].title),
                 subtitle: Text(noteProvider.notes[index].content),
               ),
             );
           },
        ),

      ),


    );
  }
}
