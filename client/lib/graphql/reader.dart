//Queries

//TODO id:int ? uuid?
String getReaders(bool id, bool name, bool phone, bool address) {
  return """
      {
        allReaders{
          ${id ? "id" : ""}
          ${name ? "name" : ""}
          ${phone ? "phone" : ""}
          ${address ? "address" : ""}
        }
      }
    """;
}

//Mutations
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


