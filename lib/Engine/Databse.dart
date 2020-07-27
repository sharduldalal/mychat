import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchQuery{
  getUserByUsername(String username){

  }
}

class AddUserInfo{
  uploadUserInfo(userMap){
    Firestore.instance.collection("users").add(userMap);

  }
}