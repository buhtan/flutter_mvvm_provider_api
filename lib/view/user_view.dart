import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider_api/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class userView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: context.watch<userViewModel>().state == userState.BUSY
            ? buildLoadingWidget()
            : context.watch<userViewModel>().state == userState.ERROR
                ? buildErrorWidget()
                : buildListView(context));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Posts'),
    );
  }

  Center buildErrorWidget() => Center(child: Text('Bir hata oluştu!'));

  Center buildLoadingWidget() => Center(child: CircularProgressIndicator());

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, index) => buildListItem(context, index));
  }

  Widget buildListItem(BuildContext context, int index) {
    final user = context.read<userViewModel>().userList[index];
    return Card(
      child: ListTile(
        title: Text(user.title.toString()),
        subtitle: Text(user.body.toString()),
      ),
    );
  }
}
