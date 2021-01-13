import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitrepo/redux/actions/movie_action.dart';
import 'package:gitrepo/redux/models/app_state.dart';

class HomePage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "isLoading": store.state.isLoading,
          "hasError": store.state.hasError,
          "search": (String username) {
            store.dispatch(SearchUserAction(username: username));
          },
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final bool hasError = args["hasError"];
        final Function search = args["search"];

        return Scaffold(
          body: isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(20),
                  // color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/github-2.png', width: 200),
                        SizedBox(height: 10),
                        Text(
                          'Git~Repo',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: usernameController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'UserName',
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        hasError
                            ? Text(
                                'Please Check Again',
                                style: TextStyle(color: Colors.red),
                              )
                            : Text(''),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            search(usernameController.text);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(80, 82, 162, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('SUBMIT'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
