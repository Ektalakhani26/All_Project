class model{
  var img;
  model(this.img);
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
  var counter = 0;
  Product(this.img, this.bname, this.subtitle, this.amount,this.discount, this.description,{this.size});
}
