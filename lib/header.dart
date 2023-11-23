/*
read me
파이어스토어에 등록하기 위해선 map객체를 add해야됨.
user생성자로 객체를 생성하면 map객체를 생성?
플러터 앱에서, 유저 객체는 나 하나만 존재해야 할듯.
통신할 유저는 불특정하고 유동적이므로, 그때그때 DB에서 가져오는게 나을듯.

변경 내역
유저 평가 지수 삭제
지역 리스트 이쪽으로 옯김
*/

import 'package:flutter/material.dart';

final List<String> _availableLocations = [
  '양호동',
  '선주 원남동',
  '도량동',
  '양포동',
  '상모 사곡동',
  '광평동',
  '칠곡',
  '진미동',
  '인동동',
  '양포동',
  '임오동',
  '도량동',
  '지산동',
  '송정동',
  '형곡동',
  '원평동',
  '신평동',
  '비산동',
  '공단동',
];

class User {
  //variable space
  String _ImageUri;
  String _nickname;
  String _id;
  String _pw;
  String _location;

  //getter, setter는 만들지 않음.
  String get getNickName => _nickname;
  String get getID => _id; //ID는 변경 불가할 것. 데이터베이스에서 사용할 것이므로
  //pw는 get 불가
  String get getLocation => _location;
  String get getImage => _ImageUri;

  //constroctor
  User(this._ImageUri, this._nickname, this._id, this._pw, this._location);

  //function
  changePW(before, after) {
    if (before != _pw) {
      return; //TODO: 나중에 팝업창 띄우기
    }
    _pw = after;
  }

  changeNickName(value) => _nickname = value;
  addDB() {}
}

class Item {
  //게시글 구성에 쓰인다.
  String imageUri; //아이템 uri 경로, list형태로 될 수도 있음.
  String title; //ppt의 아이템 이름 -> 타이틀로 변경
  String category;
  int price;
  String description; //아이템 설명
  String timestamp; //등록 시간, 시간 관련 함수를 아직 몰라서 string 형태로 해놓음
  User register; //아이템 등록자. User객체로 받는다.

  Item(this.imageUri, this.title, this.category, this.price, this.description,
      this.timestamp, this.register);
}

//서식//////////////////////////////////////////////////////////////////////////
var blackText = const TextStyle(color: Colors.black);
var largeText = const TextStyle(fontSize: 17);
var boldText = const TextStyle(fontWeight: FontWeight.bold);

///유저나 아이템의 더미데이터 선언하는 곳////////////////////////////////////////////////

