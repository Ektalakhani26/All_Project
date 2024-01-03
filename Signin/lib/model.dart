import 'dart:convert';
import 'dart:io';

class model
{
    var img;
    var desc;

    model(this.img, this.desc);
}


class form1{

    var username;
    var password;
    var email;
    var surname;

    form1(this.username, this.password);
}

// class Person{
//     var id;
//     String?  imgType;
//     File? fileImg;
//     String? product;
//     String? person;
//     String? time;
//     String? img;
//      String? desc;
//
//     Person({ this.fileImg, this.product, this.person, this.time , this.img, this.desc, this.imgType = ""});
//
//     Person fromjson(json) {
//         return Person(
//             product: json['product'],
//             person: json['person'],
//             time: json['time'],
//             desc: json['desc'],
//             fileImg: json['fileimg'],
//             imgType: json['imhtype'],
//             img: json['img'],
//         );
//
//     }
//     Map<String, dynamic> tojson(){
//         return {
//             "product" : product,
//             "person" : person,
//             "time" : time,
//             "desc" : desc,
//             "fileimg" : fileImg!,
//             "imgtype" : imgType,
//         };
//     }
//
// }


// class Model {
//     int? id;
//     String? Product;
//     String? Person;
//    // String? Time;
//    // String? desc;
//
//     Model({this.id, this.Product, this.Person});
//
//     Model fromJson(json) {
//         return Model(
//             id: json['id'], Product: json['product'], Person: json['person']);
//     }
//     Map<String, dynamic> toJson() {
//         return {'product': Product, 'person': Person};
//     }
//
// }
