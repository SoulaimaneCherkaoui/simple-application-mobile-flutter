import 'package:flutter/material.dart';
import 'package:flutter_app/about_page.dart';
import 'package:flutter_app/adherent_page.dart';
import 'package:flutter_app/livre_page.dart'; // important
// une instanciation de Material app donc ici quand va faire scafold
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text("Home Page",
        style: TextStyle(fontSize: 20),),
      )),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Image.asset(
              'assets/library.png', // Chemin relatif de votre image
              fit: BoxFit.cover,
            ),),
            ListTile(
              title: Text("Home",style: TextStyle(fontSize: 24),),
              onTap: (){

              },
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Livres",style: TextStyle(fontSize: 24)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LivrePage()));

              },
              leading: Icon(Icons.book),

            ),
            ListTile(
              title: Text("Adherents",style: TextStyle(fontSize: 24)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdherentPage()));

              },
              leading: Icon(Icons.contacts),

            ),
            ListTile(
              title: Text("About",style: TextStyle(fontSize: 24)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));

              },
              leading: Icon(Icons.question_mark),

            ),

          ],
        ) ,
      ),
    );
  }
}
