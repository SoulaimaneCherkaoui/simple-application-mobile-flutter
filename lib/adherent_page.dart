import 'package:flutter/material.dart';

class Adherent {
  final String nom;
  final String prenom;
  final String? photo; // Optionnel

  Adherent({required this.nom, required this.prenom, this.photo});
}

class AdherentPage extends StatefulWidget {
  const AdherentPage({Key? key}) : super(key: key);

  @override
  _AdherentPageState createState() => _AdherentPageState();
}

class _AdherentPageState extends State<AdherentPage> {
  final List<Adherent> adherents = [
    Adherent(nom: 'Soulaimane', prenom: 'Cherkaoui', photo: 'assets/user.jpg'),
    Adherent(nom: 'Soulaimane', prenom: 'Cherkaoui',photo: 'assets/user.jpg'),
    Adherent(nom: 'Soulaimane', prenom: 'Cherkaoui', photo: 'assets/user.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Adhérents'),
      ),
      body: ListView.builder(
        itemCount: adherents.length,
        itemBuilder: (context, index) {
          final adherent = adherents[index];
          return ListTile(
            leading: adherent.photo != null
                ? CircleAvatar(
              backgroundImage: AssetImage(adherent.photo!),
            )
                : Image.asset(
            'assets/user.jpg', // Chemin relatif de votre image
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
            title: Text('${adherent.nom} ${adherent.prenom}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirmation'),
                    content: Text('Voulez-vous vraiment supprimer cet adhérent ?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Annuler'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            adherents.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Confirmer'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController nomController = TextEditingController();
              final TextEditingController prenomController = TextEditingController();
              final TextEditingController photoController = TextEditingController();

              return AlertDialog(
                title: Text('Ajouter un Adhérent'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nomController,
                      decoration: InputDecoration(labelText: 'Nom'),
                    ),
                    TextField(
                      controller: prenomController,
                      decoration: InputDecoration(labelText: 'Prénom'),
                    ),
                    TextField(
                      controller: photoController,
                      decoration: InputDecoration(labelText: 'URL de la Photo'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Annuler'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final nouveauAdherent = Adherent(
                        nom: nomController.text,
                        prenom: prenomController.text,
                        photo: photoController.text.isNotEmpty ? photoController.text : null,
                      );
                      setState(() {
                        adherents.add(nouveauAdherent);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Ajouter'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
