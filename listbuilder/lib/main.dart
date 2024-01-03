import 'package:flutter/material.dart';
import 'package:listbuilder/phonebook/ContentNumber.dart';
import 'package:listbuilder/phonedetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Phone Book'),
        ),
        body: ContentNumber(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader(
              //     child: Text('hii'),
              //   decoration: BoxDecoration(color: Colors.purpleAccent),
              // ),
              UserAccountsDrawerHeader(
                  accountName: Text('Ekta Lakhani'),
                  accountEmail: Text('ektalakhani@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:  AssetImage('assets/ekta2.jpg'),
                  ),
              ),
              ListTile(
                leading: Icon(Icons.person,size: 40,),
                title: Text('Account'),
                subtitle: Text('personnel'),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                leading: Icon(Icons.email,size: 40,),
                title: Text('Email'),
                subtitle: Text('personnel'),
                trailing: Icon(Icons.send),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled),
              label: 'Recents',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_rounded),
              label: 'Contacts',
            ),
          ],
           currentIndex: _selectedIndex,
           selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class ContentNumber extends StatefulWidget {
  const ContentNumber({Key? key}) : super(key: key);
  @override
  State<ContentNumber> createState() => _ContentNumberState();
}

class _ContentNumberState extends State<ContentNumber> {
  List<Content> contantlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contantlist.add(Content('sangita', 'Phone * Thu', 'assets/sangita.jpg','call_missed'));
    contantlist.add(Content('breket', 'Phone * Wed', 'assets/kaushik.jpg','call_made'));
    contantlist.add(Content('Error', 'Phone * Wed', 'assets/Error1.jpg','call_missed'));
    contantlist.add(Content('4528635241', 'Junk * March 6', 'assets/junk.jpg','call_made'));
    contantlist.add(Content('pointer', 'Phone * Sat', 'assets/pointer1.jpg','call_made'));
    contantlist.add(Content('Margin', 'Phone * Mon', 'assets/margin1.jpg','call_missed'));
    contantlist.add(Content('Mom', 'Phone * Sun', 'assets/Mom.jpg','call_missed'));
    contantlist.add(Content('4528635241', 'Junk * March 6', 'assets/junk.jpg','call_missed'));
    contantlist.add(Content('Dad', 'Phone * March 29', 'assets/dad.jpg','call_missed'));
    contantlist.add(Content('Diii', 'Phone * March 28', 'assets/Dii1.jpg','call_missed'));
    contantlist.add(Content('Hiren sir', 'Phone * March 28', 'assets/hirensir.jpg','call_missed'));
    contantlist.add(Content('uncle', 'Phone * March 26', 'assets/uncle1.jpg','call_missed'));
    contantlist.add(Content('Aunty', 'Phone * March 25', 'assets/uncle1.jpg','call_missed'));
    contantlist.add(Content('2587458965', 'Junk * March 6', 'assets/junk.jpg','call_missed'));
    contantlist.add(Content('4528635241', 'Junk * March 6', 'assets/junk.jpg','call_missed'));
    contantlist.add(Content('7895462541', 'Unknow * March 1', 'assets/junk.jpg','call_missed'));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: contantlist.length,
      itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          print('calling ${contantlist[index].name}');
          //Navigator.push(context, MaterialPageRoute(builder: (context) => PhnoDetail(),));
        },
        title: Row(
          children: [
            Text('${contantlist[index].name}'),
            Icon(Icons.wifi_outlined,size: 20),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(Icons.call_missed,color: Colors.red),
            //Icon('${contantlist[index].icon}' as IconData?),
            Text('${contantlist[index].phno}',style: TextStyle(color: Colors.red)),
          ],
        ),
        leading: CircleAvatar(
          maxRadius: 40,
          backgroundImage: AssetImage('${contantlist[index].img}'),
        ),
        trailing: Icon(Icons.wifi_calling_3_sharp,color: Colors.green),
      );
    },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.black26,
          height: 1,
        );
    },
    );
  }
}

