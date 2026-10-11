# Menu du Restaurant - Flutter

Projet Flutter réalisé pour le DS "Layouts & Scrolls" (ESGI).

L'application affiche le menu d'un restaurant :
- une barre de catégories qui défile horizontalement (Formules, Entrées, Plats, Desserts, Boissons)
- quand on clique sur une catégorie, la liste des plats de cette catégorie s'affiche
- chaque plat est dans une carte avec son image, son nom, une description et son prix

## Widgets utilisés
- `Column` pour la page (catégories en haut, plats en dessous)
- `Row` dans un `SingleChildScrollView` horizontal pour les catégories
- `ListView.builder` pour la liste des plats (et `GridView.builder` en mode paysage)
- `Card`, `Padding`, `Image`, `SizedBox`, `Container`, `Expanded` pour les cartes
- un widget `CartePlat` réutilisé pour tous les plats

## Lancer le projet
```
flutter pub get
flutter run
```

## Captures d'écran
<!-- mettre les captures dans un dossier screenshots/ -->
![portrait](screenshots/portrait.png)
![paysage](screenshots/paysage.png)

## Vidéo
<!-- lien vers la vidéo -->
