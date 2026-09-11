# Dépannage

## La commande `love` est introuvable

- Vérifiez que LÖVE2D est installé depuis [love2d.org](https://love2d.org/).
- Sur macOS, essayez `/Applications/love.app/Contents/MacOS/love .`.
- Vérifiez que le terminal est ouvert dans le dossier contenant `main.lua`.

## LÖVE2D affiche « No game »

Vous avez lancé le mauvais dossier. La commande doit cibler le dossier dans lequel se trouve directement `main.lua`.

## Écran bleu avec un message d'erreur

Lisez d'abord le nom du fichier et le numéro de ligne. Les causes fréquentes sont :

- un `end` oublié ou en trop ;
- une parenthèse, une accolade ou un guillemet non fermé ;
- `=` utilisé à la place de `==` dans une condition ;
- une virgule oubliée dans une table ;
- une majuscule différente dans le nom d'une variable ;
- une variable utilisée avant sa création.

## Le joueur traverse le sol

Vérifiez la condition sur `joueur.y + joueur.hauteur`. Après le contact, il faut faire les trois actions suivantes :

```lua
joueur.y = solY - joueur.hauteur
joueur.vitesseY = 0
joueur.auSol = true
```

## Le joueur reste collé en l'air

La gravité et la modification de `joueur.y` doivent être exécutées à chaque image pendant la partie, pas seulement lors de l'appui sur `Espace`.

## Le joueur peut sauter sans limite

Vérifiez `joueur.auSol` avant le saut et passez cette variable à `false` au moment de sauter.

## Le saut est trop haut ou trop bas

- Plus la vitesse négative est grande en valeur absolue, plus le saut est puissant : `-600` saute plus haut que `-400`.
- Plus la gravité est forte, plus le joueur redescend rapidement.
- Ne retirez pas `dt` des calculs.

## L'obstacle va dans le mauvais sens

Pour aller à gauche, il faut soustraire la vitesse à `obstacle.x`.

## L'obstacle ne revient jamais

Testez son bord droit :

```lua
obstacle.x + obstacle.largeur < 0
```

Puis donnez-lui une nouvelle valeur `x` supérieure à la largeur de la fenêtre.

## La collision ne fonctionne pas

- Vérifiez les quatre comparaisons de la fonction `collision`.
- Utilisez `and` entre les comparaisons.
- Vérifiez que la fonction retourne le résultat avec `return`.
- Vérifiez que `collision(joueur, obstacle)` est appelée dans `love.update(dt)`.

Pour visualiser les zones, dessinez temporairement leurs contours :

```lua
love.graphics.rectangle("line", joueur.x, joueur.y, joueur.largeur, joueur.hauteur)
love.graphics.rectangle("line", obstacle.x, obstacle.y, obstacle.largeur, obstacle.hauteur)
```

## Le score continue après le Game Over

Le code fourni contient :

```lua
if gameOver then
    return
end
```

Ce test doit rester avant l'augmentation du score.

## `R` ne relance pas le jeu

- LÖVE2D transmet la lettre en minuscule : comparez avec `"r"`.
- Vérifiez que `recommencer()` remet bien `gameOver` à `false`.
- Vérifiez que la fonction est appelée depuis `love.keypressed`.

## Afficher une valeur pour comprendre

Ajoutez temporairement dans `love.draw()` :

```lua
love.graphics.print("y joueur : " .. joueur.y, 20, 50)
love.graphics.print("vitesseY : " .. joueur.vitesseY, 20, 70)
love.graphics.print("auSol : " .. tostring(joueur.auSol), 20, 90)
```

Cela permet d'observer les valeurs pendant l'exécution. Supprimez ces lignes lorsque le problème est résolu.
