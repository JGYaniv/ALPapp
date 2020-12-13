class QueryMutation {
  String addReader(String id, String name, String phone, String address) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", phone: "$phone", address: $address){
            id
            name
            phone
            address
          }
      }
    """;
  }

  String getReaders(){
    return """
      {
        allReaders{
          id
          name
          phone
          address
        }
      }
    """;
  }
}

