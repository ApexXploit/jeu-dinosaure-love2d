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

## Besoin d'aide ?

Choisissez seulement le niveau d'aide dont vous avez besoin :

| Niveau | Ressource | Quand l'utiliser |
|---|---|---|
| 1 | [FICHE-AIDE.md](FICHE-AIDE.md) | Pour comprendre une notion ou obtenir un petit indice |
| 2 | [GUIDE-PAS-A-PAS.md](GUIDE-PAS-A-PAS.md) | Pour construire le jeu étape par étape avec des tests |
| 3 | [DEPANNAGE.md](DEPANNAGE.md) | Quand le jeu affiche une erreur ou se comporte mal |
| 4 | [correction/main.lua](correction/main.lua) | En dernier recours, pour comparer avec une version fonctionnelle |

Conseil : ne remplacez pas immédiatement votre fichier par la correction. Comparez une seule fonction, comprenez la différence, puis corrigez votre propre code.

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

### Télécharger sans utiliser Git

Sur GitHub, cliquez sur **Code**, puis **Download ZIP**. Décompressez le fichier avant de l'ouvrir.

### Cloner avec Git

```bash
git clone https://github.com/ApexXploit/jeu-dinosaure-love2d.git
cd jeu-dinosaure-love2d
love .
```

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

### Checklist avant le rendu

- [ ] Le jeu se lance sans message d'erreur.
- [ ] Le personnage est posé sur le sol au démarrage.
- [ ] `Espace` fait sauter le personnage.
- [ ] Il est impossible de sauter une deuxième fois en l'air.
- [ ] L'obstacle se déplace de droite à gauche.
- [ ] L'obstacle revient après avoir quitté l'écran.
- [ ] Une collision affiche « Game Over ».
- [ ] Le score s'arrête après la collision.
- [ ] `R` recommence une partie complète.
- [ ] Le code est indenté, lisible et commenté.
