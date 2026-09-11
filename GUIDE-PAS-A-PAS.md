# Guide pas à pas

Travaillez dans `main.lua`. Après chaque étape, lancez le jeu : une petite erreur est beaucoup plus facile à retrouver que dix erreurs ajoutées en même temps.

## Comprendre l'écran

L'origine `(0, 0)` se trouve en haut à gauche.

```text
(0,0) ───────────────► x augmente
  │
  │        joueur       obstacle
  │          █              █
  │          █              █
  │  ─────────────────────────── solY
  ▼
  y augmente
```

Monter signifie donc diminuer `y`. Descendre signifie augmenter `y`.

## Étape 0 — Lancer le projet

Dans le terminal, placez-vous dans le dossier puis lancez :

```bash
love .
```

Résultat attendu : une fenêtre de 800 × 450 pixels avec un rectangle vert, un rectangle rouge, un sol et un score à zéro.

Si la fenêtre n'apparaît pas, consultez [DEPANNAGE.md](DEPANNAGE.md).

## Étape 1 — Faire tomber le joueur

Dans `love.update(dt)`, remplacez les `TODO 1` et `TODO 2`.

Pseudo-code :

```text
ajouter gravite × dt à la vitesse verticale
ajouter vitesse verticale × dt à la position y
```

Test : le joueur doit tomber. Pour cette étape seulement, il peut traverser le sol.

## Étape 2 — Arrêter le joueur sur le sol

Le bas du joueur vaut `joueur.y + joueur.hauteur`.

Pseudo-code du `TODO 3` :

```text
SI le bas du joueur dépasse ou touche le sol ALORS
    placer le joueur juste au-dessus du sol
    mettre sa vitesse verticale à zéro
    indiquer qu'il est au sol
FIN
```

Test : le joueur tombe puis reste exactement sur la ligne.

## Étape 3 — Déplacer l'obstacle

Pour aller vers la gauche, il faut diminuer `obstacle.x`.

Pseudo-code du `TODO 4` :

```text
obstacle.x devient obstacle.x moins obstacle.vitesse × dt
```

Test : le rectangle rouge traverse l'écran de droite à gauche.

## Étape 4 — Faire revenir l'obstacle

L'obstacle est entièrement sorti lorsque son bord droit est inférieur à zéro.

Pseudo-code du `TODO 5` :

```text
SI obstacle.x + obstacle.largeur est inférieur à zéro ALORS
    replacer obstacle.x après le bord droit de la fenêtre
FIN
```

Pour varier la distance :

```lua
love.graphics.getWidth() + math.random(150, 350)
```

Test : attendez quelques secondes. L'obstacle doit revenir tout seul.

## Étape 5 — Faire augmenter le score

Au `TODO 6`, ajoutez `dt` au score.

Test : le nombre affiché en haut à gauche augmente environ une fois par seconde.

## Étape 6 — Programmer le saut

Dans `love.keypressed(key)`, traitez le `TODO 8`.

Trois conditions doivent être vraies :

- `key` vaut `"space"` ;
- `joueur.auSol` vaut `true` ;
- `gameOver` vaut `false`.

Quand elles sont vraies :

```text
donner une vitesse verticale négative au joueur
indiquer que le joueur n'est plus au sol
```

Essayez `-500` pour la vitesse du saut.

Test : `Espace` fait monter puis redescendre le joueur. Appuyer plusieurs fois en l'air ne produit aucun nouveau saut.

## Étape 7 — Compléter la collision

Au `TODO 10`, deux rectangles se touchent si les quatre affirmations suivantes sont vraies :

```text
le côté gauche de A est avant le côté droit de B
le côté gauche de B est avant le côté droit de A
le haut de A est avant le bas de B
le haut de B est avant le bas de A
```

Traduisez chaque ligne avec `x`, `y`, `largeur` et `hauteur`, puis reliez-les avec `and`. La formule complète se trouve dans la fiche d'aide si nécessaire.

## Étape 8 — Déclencher le Game Over

Au `TODO 7` :

```text
SI collision(joueur, obstacle) ALORS
    gameOver devient true
FIN
```

Test : ne sautez pas. Au contact de l'obstacle, tout doit s'arrêter et le message doit apparaître.

## Étape 9 — Recommencer

Au `TODO 11`, réinitialisez :

- `score` à `0` ;
- `gameOver` à `false` ;
- la position et la vitesse verticale du joueur ;
- `joueur.auSol` à `true` ;
- la position de l'obstacle après le bord droit.

Au `TODO 9`, appelez `recommencer()` si la touche est `"r"` et si la partie est terminée.

Test final : perdez, appuyez sur `R`, puis vérifiez que le jeu repart comme au premier lancement.

## Étape 10 — Nettoyer le code

- Supprimez les commentaires `TODO` terminés.
- Indentez le contenu de chaque `if` et de chaque fonction.
- Utilisez des noms compréhensibles.
- Ajoutez un court commentaire pour les calculs difficiles.
- Effectuez toute la checklist du README.

## Comprendre avant de valider

Vous devez pouvoir expliquer oralement :

1. Pourquoi multiplie-t-on les déplacements par `dt` ?
2. Pourquoi la vitesse du saut est-elle négative ?
3. À quoi sert `joueur.auSol` ?
4. Comment sait-on que deux rectangles se touchent ?
5. Quelles valeurs faut-il réinitialiser pour recommencer ?
