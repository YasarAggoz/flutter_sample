
class usermap {
  String? id;
  String? name;
  String? surname;


  usermap(
      {  this.id,   this.name,   this.surname });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,


    };
  }

  usermap.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        surname = firestore['loginname'];


}

