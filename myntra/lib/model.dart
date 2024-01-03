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

class Product{
    var img;
    var bname;
    var subtitle;
    var amount;
    var description;
    var size;
    var discount;
    static int counter = 1;
    Product(this.img, this.bname, this.subtitle, this.amount,this.discount, this.description,{this.size});
}
