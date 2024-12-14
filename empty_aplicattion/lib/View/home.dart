import 'package:flutter/material.dart';
import 'package:empty_aplicattion/View/view_list.dart';

class HomeView extends StatefulWidget {
    const HomeView({super.key});

    @override
    State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
}

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Image(image: NetworkImage('https://picsum.photos/200/300'))
      ),

    ListNamaView(),

    

    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(height: 20),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text('Username: Ucup Surucup', style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock),
              SizedBox(width: 10),
              Text('Password: xxxxxxx', style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.male),
              SizedBox(width: 10),
              Text('Gender: Male', style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
     
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text('Phone: 082123456789', style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 10),
              Text('Email: ucup@gmail.com', style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    ),
   
        
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list,),label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
