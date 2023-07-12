import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';


class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar(){
    return AppBar(
      title: const Text("Daily News", style: TextStyle(color: Colors.black),),
    );
  }

  _buildBody(){
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state){
        if(state is RemoteArticleLoading){
          return const Center(child: CupertinoActivityIndicator());
        }

        if(state is RemoteArticleError){
          return const Center(child: Icon(Icons.refresh));
        }

        if(state is RemoteArticleDone){
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index){
              return ListTile();
            }
            );
        }

        return const Placeholder();
      }
      );
  }
}