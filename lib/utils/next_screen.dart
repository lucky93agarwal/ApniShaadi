import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextScreen (context, page){
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => page));
}
void nextNameScreen (context, name,arguments){
  Navigator.pushNamed(context, name,arguments:arguments==null?null:arguments);
}

void backScreen(context){
  Navigator.pop(context);
}
void nextScreeniOS (context, page,Function FuntionData){
  Navigator.push(context, CupertinoPageRoute(
      builder: (context) => page)).then((value) {
    FuntionData;
  });
}


void nextScreenCloseOthers(context, page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScreenReplace (context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}


void nextScreenPopup (context, page){
  Navigator.push(context, MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => page),
  );
}


/*
void navigateToDetailsScreen (context, Article article, String? heroTag){
  if(article.tags == null || !article.tags!.contains(WpConfig.videoTagId)){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ArticleDetails(articleData: article, tag: heroTag,)),
    );
  }else{
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => VideoArticleDeatils(article: article)),
    );
  }
}

void navigateToDetailsScreenByReplace (context, Article article, String? heroTag){
  if(article.tags == null || !article.tags!.contains(WpConfig.videoTagId)){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ArticleDetails(articleData: article, tag: heroTag,)),
    );
  }else{
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => VideoArticleDeatils(article: article)),
    );
  }
}


void navigateToNotificationDetailsScreen (context, NotificationModel notificationModel){
  if(notificationModel.postID == null){
    nextScreen(context, CustomNotificationDeatils(notificationModel: notificationModel));
  }else{
    nextScreen(context, PostNotificationDetails(postID: notificationModel.postID!));
  }
}*/
