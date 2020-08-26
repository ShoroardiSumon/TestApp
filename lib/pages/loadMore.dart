import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:test_app/pages/pro_data_EX.dart';

class LoadMoreEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _providerdata = Provider.of<ProData>(context);
    _providerdata.fetchToDo();
    _providerdata.loadMoreLM();
    _providerdata.refreshLM();

    return Scaffold(
      appBar: AppBar(
        title: Text('Load More Data'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: RefreshIndicator(
          child: LoadMore(
            isFinish: _providerdata.toDoList.length >= 50,
            onLoadMore: _providerdata.loadMoreLM,
            child: ListView.builder(
              itemCount: _providerdata.toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(_providerdata.toDoList[index].id.toString()),
                    ),
                    title: Text(_providerdata.toDoList[index].title),
                  ),
                );
              },
            ),
            whenEmptyLoad: false,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.english,
          ),
          onRefresh: _providerdata.refreshLM,
        ),
      ),
    );
  }
}
