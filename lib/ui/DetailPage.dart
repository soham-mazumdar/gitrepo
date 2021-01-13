import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitrepo/redux/models/app_state.dart';
import 'package:gitrepo/redux/models/profile.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "currentUser": store.state.currentUser,
        };
        return args;
      },
      builder: (context, args) {
        final Profile currentUser = args['currentUser'];

        return Scaffold(
          appBar: AppBar(title: Text(currentUser.name)),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(currentUser.image),
                ),
                SizedBox(height: 10),
                Text(
                  currentUser.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                currentUser.email != null
                    ? Text(currentUser.email)
                    : SizedBox(),
                currentUser.company != null
                    ? Text('Company : ' + currentUser.company)
                    : SizedBox(),
                currentUser.blog != null
                    ? Text('Blog : ' + currentUser.blog)
                    : SizedBox(),
                currentUser.hireable != null
                    ? Text('Hireable : ' + currentUser.hireable)
                    : SizedBox(),
                currentUser.location != null
                    ? Text('Location : ' + currentUser.location)
                    : SizedBox(),
                SizedBox(height: 10),
                currentUser.bio != null ? Text(currentUser.bio) : SizedBox(),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: currentUser.repos.length,
                    itemBuilder: (context, index) {
                      final DateTime now =
                          DateTime.parse(currentUser.repos[index].createdAt);
                      final DateFormat formatter = DateFormat('dd-MM-yyyy');
                      final String createdAt = formatter.format(now);

                      return Container(
                        child: ExpansionTile(
                          childrenPadding: EdgeInsets.fromLTRB(20, 0, 10, 10),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          expandedAlignment: Alignment.centerLeft,
                          title: Text(currentUser.repos[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(createdAt),
                            ],
                          ),
                          children: <Widget>[
                            Wrap(
                              children: [
                                Text(currentUser.repos[index].language
                                    .toString()),
                                Text(' | Forks : ' +
                                    currentUser.repos[index].forksCount
                                        .toString()),
                                Text(' | Wotcher : ' +
                                    currentUser.repos[index].watchersCount
                                        .toString()),
                                Text(' | Open Issues : ' +
                                    currentUser.repos[index].openIssuesCount
                                        .toString()),
                                        
                              ],
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                              child: SelectableText(
                                currentUser.repos[index].gitUrl,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(currentUser.repos[index].description
                                .toString()),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
