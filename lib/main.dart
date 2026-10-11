import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu du Restaurant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MenuPage(),
    );
  }
}

// classe pour representer un plat
class Plat {
  String nom;
  String description;
  double prix;
  String image;
  String categorie;

  Plat(this.nom, this.description, this.prix, this.image, this.categorie);
}

// la liste des categories
List<String> categories = ['Formules', 'Entrées', 'Plats', 'Desserts', 'Boissons'];

// les plats sont ecrits en dur dans une liste (c'est autorisé dans le sujet)
List<Plat> plats = [
  // Formules
  Plat('Formule Burger', 'Burger maison, frites et une boisson au choix.', 15.90,
      'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?w=400', 'Formules'),
  Plat('Formule Steak', 'Steak grillé avec ses frites maison et une boisson.', 18.50,
      'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=400', 'Formules'),
  Plat('Formule Healthy', 'Bowl au saumon, légumes frais et un jus pressé.', 16.00,
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400', 'Formules'),

  // Entrées
  Plat('Raviolis vapeur', 'Raviolis aux légumes cuits à la vapeur, sauce soja.', 7.50,
      'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=400', 'Entrées'),
  Plat('Salade du chef', 'Salade verte, oignons rouges, carottes et vinaigrette.', 6.90,
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400', 'Entrées'),
  Plat('Assiette végétarienne', 'Avocat, pois chiches, tomates cerises et crudités.', 8.00,
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400', 'Entrées'),

  // Plats
  Plat('Pizza du moment', 'Pâte fine, sauce tomate, poivrons et oignons.', 12.50,
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400', 'Plats'),
  Plat('Cheeseburger', 'Pain brioché, steak haché, cheddar et salade.', 13.00,
      'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 'Plats'),
  Plat('Curry de crevettes', 'Crevettes dans une sauce curry, servies avec du riz.', 15.50,
      'https://images.unsplash.com/photo-1559847844-5315695dadae?w=400', 'Plats'),
  Plat('Boeuf sauté', 'Boeuf sauté aux épices avec des légumes croquants.', 16.90,
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400', 'Plats'),

  // Desserts
  Plat('Tiramisu', 'Le classique italien au café et mascarpone.', 6.50,
      'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400', 'Desserts'),
  Plat('Donuts', 'Deux donuts au chocolat et vermicelles colorés.', 5.00,
      'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400', 'Desserts'),
  Plat('Coupe chocolat', 'Crème au chocolat, biscuits et chantilly.', 6.90,
      'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400', 'Desserts'),
  Plat('Verrine fraise', 'Yaourt et fraises fraîches en verrine.', 5.50,
      'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400', 'Desserts'),

  // Boissons
  Plat('Limonade fraise', 'Limonade maison à la fraise et au citron vert.', 4.50,
      'https://images.unsplash.com/photo-1497534446932-c925b458314e?w=400', 'Boissons'),
  Plat('Cocktail sans alcool', 'Mélange de fruits frais, servi bien frais.', 6.00,
      'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400', 'Boissons'),
  Plat("Jus d'orange", "Jus d'orange pressé minute.", 3.50,
      'https://images.unsplash.com/photo-1541795795328-f073b763494e?w=400', 'Boissons'),
];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // categorie selectionnée (au debut c'est la premiere)
  String categorieChoisie = 'Formules';

  @override
  Widget build(BuildContext context) {
    // on garde seulement les plats de la categorie choisie
    List<Plat> platsAffiches = [];
    for (var p in plats) {
      if (p.categorie == categorieChoisie) {
        platsAffiches.add(p);
      }
    }

    // pour savoir si on est en mode paysage
    bool paysage = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu du Restaurant X'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      // Column pour mettre les categories en haut et la liste des plats en dessous
      body: Column(
        children: [
          // barre des categories : un Row dans un SingleChildScrollView horizontal
          // comme ca on peut faire defiler si il y a trop de categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: categories.map((c) => boutonCategorie(c)).toList(),
            ),
          ),

          // Expanded pour que la liste prenne toute la place qui reste
          Expanded(
            child: paysage
                // en paysage on met 2 cartes par ligne pour pas avoir trop de vide
                ? GridView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: platsAffiches.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 150,
                    ),
                    itemBuilder: (context, index) {
                      return CartePlat(plat: platsAffiches[index]);
                    },
                  )
                // en portrait une simple liste verticale
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: platsAffiches.length,
                    itemBuilder: (context, index) {
                      return CartePlat(plat: platsAffiches[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // un bouton pour une categorie
  Widget boutonCategorie(String nom) {
    bool estChoisie = nom == categorieChoisie;

    return GestureDetector(
      onTap: () {
        setState(() {
          categorieChoisie = nom;
        });
      },
      // AnimatedContainer pour avoir une petite animation quand on change de categorie
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: estChoisie ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          nom,
          style: TextStyle(
            color: estChoisie ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// widget pour afficher un plat dans une carte
// on le reutilise pour tous les plats (pas de code en double)
class CartePlat extends StatelessWidget {
  final Plat plat;

  const CartePlat({super.key, required this.plat});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        // Row : l'image a gauche et le texte a droite
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                plat.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                // si l'image ne charge pas (pas d'internet) on met une icone
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.restaurant),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            // Expanded pour que le texte prenne la place restante et ne deborde pas
            Expanded(
              // Column : nom, description puis prix les uns sous les autres
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plat.nom,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plat.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${plat.prix.toStringAsFixed(2)} €',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
