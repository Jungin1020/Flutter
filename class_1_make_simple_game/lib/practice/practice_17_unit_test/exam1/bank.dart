Map<String, dynamic> json = {
  "name": "홍길동",
  "address": "서울시 어쩌구 저쩌구",
  "phone": "010-1111-2222"
};

class Bank {
  String name;
  String address;
  String phone;

  Bank(this.name, this.address, this.phone);

  Bank.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
      };
}
