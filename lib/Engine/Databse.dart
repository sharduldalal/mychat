import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchQuery {
  getUserByUsername(String username) async {
    return await Firestore.instance.collection("users").where(
        "name", isEqualTo: username).getDocuments();
  }
}

class AddUserInfo {
  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }
}

class CreateChatPage {
  createPage(String chatsId, chatsMap) {
    Firestore.instance.collection("Chats").document(chatsId)
        .setData(chatsMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}

class LoginPage {
  getUserByEmail(String email) async {
    return await Firestore.instance.collection("users").where(
        "name", isEqualTo: email).getDocuments();
  }
}

class Messages {
  ChatMessages(String chatsId, MessageMap) {
    Firestore.instance
        .collection("Chats").document(chatsId).collection("ChatsMessages").add(MessageMap).catchError((e){print(e.toString());});
  }
  getChatMessages(String chatsId) async {
    return await Firestore.instance
        .collection("Chats").document(chatsId).collection("ChatsMessages").orderBy("Time",descending: false).snapshots();
  }
}

class AllTheChats{
  getAllTheChats(String username) async {
    return await Firestore.instance.collection("Chats").where("users", arrayContains: username).snapshots();
  }
  /*getAllTheChats(chatRoom, chatRoomId){
    Firestore.instance
        .collection("Chats")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }*/
}