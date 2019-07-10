import 'dart:convert';

class IPModel {
  String id;
  String name;
  String type;
  String desc;
  String atk;
  String def;
  String level;
  String race;
  String attribute;
  String card_images;
  String card_prices;

  IPModel({
    this.id,
    this.name,
    this.type,
    this.desc,
    this.atk,
    this.def,
    this.level,
    this.race,
    this.attribute,
    this.card_images,
    this.card_prices,
  });

  factory IPModel.fromJson(Map<String, dynamic> json) {
    return IPModel(
      id: json['id'], 
      name: json['name'], 
      type: json['type'], 
      desc: json['desc'],
      atk: json['atk'], 
      def: json['def'], 
      level: json['level'],
      race: json['race'],
      attribute: json['attribute'],
      card_images: json['card_images'],
      card_prices: json['card_images'],
    );
  }
}
