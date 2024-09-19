import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note_model.dart';
import '../providers/note_provider.dart';

class NoteSerachDelegate extends SearchDelegate
{
  Widget buildSearchBar(BuildContext context)
  {
    return TextField(
      onChanged: (query)
      {
      },
      decoration: InputDecoration(
        labelText: "search",
        border: OutlineInputBorder()
      ),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[IconButton(onPressed: (){query = " ";}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<note_model> searchresult = Provider.of<noteprovider>(context).searchnotes(query) as List<note_model>;
    return ListView.builder(
        itemCount: searchresult.length,
        itemBuilder: (context, index)=>ListTile(
          title: Text(searchresult[index].title),
          subtitle: Text(searchresult[index].content),
        ),
    );
  }

}