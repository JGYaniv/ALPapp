class Reader {
  String name, mail, phone, address;

  Reader({this.name, this.mail, this.phone, this.address});

  Map<String, dynamic> toJson() {
    
    return <String, dynamic>{
      "name": name,
      "mail": mail,
      "phone": phone,
      "address": address,
    }..removeWhere((key, value) => key == null || value == null);
  }

  Reader.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    mail = json["mail"];
    phone = json["phone"];
    address = json["address"];
  }
}
