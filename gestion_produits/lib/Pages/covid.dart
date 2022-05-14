
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_produits/Providers/list_covid_state.dart';
import 'package:provider/provider.dart';

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid-19"),
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
                        Provider.of<ListCovidtState>(context, listen: false)
                            .searchCovid(value);
                      },
                  controller:
                      Provider.of<ListCovidtState>(context, listen: false)
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
                  child: Consumer<ListCovidtState>(
                  builder: (context, ListCovidtState, child) {
                    return ListView.builder(
                        itemCount: ListCovidtState.cases == null ||
                            ListCovidtState.cases["All"] == null ? 0 : 1,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: ListTile(
                                leading: CircleAvatar(
                                  // backgroundImage: NetworkImage(cases["All"][index]["urlToImage"]),
                                  backgroundImage: NetworkImage(
                                      ListCovidtState.image),
                                  radius: 30,
                                ),
                                title: Text("Country : " +
                                    ListCovidtState.cases["All"]["country"]
                                        .toString() +
                                    "\nConfirmed cases: " +
                                    ListCovidtState.cases["All"]["confirmed"]
                                        .toString() +
                                    "\nDeaths cases: " +
                                    ListCovidtState.cases["All"]["deaths"]
                                        .toString()),
                              ));
                        });
                  }))
          ],
        ),
      ),
    );
  }
}
