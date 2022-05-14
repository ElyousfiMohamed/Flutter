import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_produits/Providers/list_github_state.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class GitHubUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                    onChanged : (String value) async {
                      Provider.of<ListGithubState>(context, listen: false)
                          .searchGithubUser(value);
                    },
                  controller:
                      Provider.of<ListGithubState>(context, listen: false)
                          .textEditingController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.green.shade400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.green.shade400)),
                    prefixIcon: const Icon(Icons.search),
                  ),
                )),
              ],
            ),
            Expanded(
              child: Consumer<ListGithubState>(
                  builder: (context, ListGithubState, child) {
                return ListView.builder(
                  itemCount: ListGithubState.users == null ||
                          ListGithubState.users["items"] == null
                      ? 0
                      : ListGithubState.users["items"].length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(ListGithubState
                            .users["items"][index]["avatar_url"]),
                      ),
                      title:
                          Text(ListGithubState.users["items"][index]["login"]),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
