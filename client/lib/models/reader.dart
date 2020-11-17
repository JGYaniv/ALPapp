class Reader {
  String name, phone, address;

  Reader({String name, phone, address}){
    this.name = name;
    this.phone = phone;
    this.address = address;
  }

  //model validations

  void save() async {
    //save reader to db and provider
  }

  void update() async {
    //update reader details and provider
  }

  void delete() async {
    //delete reader and provider
  }
}