# Projet LÖVE2D — Le jeu du dinosaure

## Mission

Créer avec **Lua et LÖVE2D** un jeu inspiré du dinosaure du navigateur lorsqu'il n'y a plus de connexion Internet.

Le personnage reste à gauche de l'écran. Des obstacles arrivent depuis la droite : le joueur doit sauter pour les éviter et obtenir le meilleur score possible.

## Objectifs pédagogiques

À la fin de l'exercice, vous saurez :

- utiliser `love.load`, `love.update`, `love.draw` et `love.keypressed` ;
- déplacer des objets en tenant compte de `dt` ;
- programmer un saut avec une vitesse verticale et la gravité ;
- détecter une collision entre deux rectangles ;
- gérer les états « partie en cours » et « Game Over » ;
- afficher et réinitialiser un score.

## Consignes

Votre jeu doit comporter :

1. un personnage visible à gauche de l'écran ;
2. un sol ;
3. un saut avec la touche `Espace` ;
4. une gravité qui ramène le personnage au sol ;
5. un obstacle se déplaçant de droite à gauche ;
6. un nouvel obstacle lorsqu'il sort de l'écran ;
7. une détection des collisions ;
8. un score qui augmente pendant la partie ;
9. un écran « Game Over » ;
10. un redémarrage avec la touche `R`.

Le personnage ne doit pas pouvoir effectuer un deuxième saut lorsqu'il est déjà dans les airs.

## Démarrage

1. Installez [LÖVE2D](https://love2d.org/).
2. Clonez ou téléchargez ce dépôt.
3. Ouvrez le fichier `main.lua`.
4. Remplacez progressivement les commentaires `TODO` par votre code.
5. Lancez le jeu depuis le dossier du projet :

```bash
love .
```

Sur macOS, si la commande `love` n'est pas disponible :

```bash
/Applications/love.app/Contents/MacOS/love .
```

Vous pouvez consulter [FICHE-AIDE.md](FICHE-AIDE.md) si vous êtes bloqué. Essayez chaque étape avant de regarder l'indice suivant.

## Ordre de réalisation conseillé

- Étape 1 : afficher le personnage, le sol et l'obstacle.
- Étape 2 : déplacer l'obstacle vers la gauche.
- Étape 3 : programmer le saut et la gravité.
- Étape 4 : replacer l'obstacle après sa sortie de l'écran.
- Étape 5 : détecter les collisions.
- Étape 6 : ajouter le score et le redémarrage.
- Étape 7 : améliorer l'apparence et la difficulté.

## Bonus

- faire accélérer le jeu progressivement ;
- créer plusieurs obstacles ou des tailles aléatoires ;
- ajouter un meilleur score ;
- remplacer les rectangles par des images ;
- ajouter une animation, des sons ou un cycle jour/nuit ;
- permettre au personnage de se baisser.

## Barème — 20 points

| Critère | Points |
|---|---:|
| Personnage, sol et obstacle affichés | 3 |
| Saut, gravité et retour au sol | 4 |
| Déplacement et réapparition de l'obstacle | 3 |
| Collision et fin de partie | 4 |
| Score et redémarrage | 3 |
| Code lisible, organisé et commenté | 2 |
| Amélioration personnelle | 1 |

## Rendu attendu

Déposez votre projet complet selon la méthode indiquée par le formateur. Avant de le rendre, vérifiez que la commande `love .` lance le jeu sans erreur.

