# Fiche d'aide — Jeu du dinosaure avec LÖVE2D

Cette fiche donne des indices progressifs. Ne copiez pas tout immédiatement : testez votre jeu après chaque modification.

## 1. Les fonctions principales

```lua
function love.load()
    -- Exécutée une fois au démarrage
end

function love.update(dt)
    -- Exécutée à chaque image pour faire évoluer le jeu
end

function love.draw()
    -- Exécutée à chaque image pour dessiner le jeu
end

function love.keypressed(key)
    -- Exécutée lorsqu'une touche est pressée
end
```

`dt` représente le temps écoulé depuis l'image précédente. Pour obtenir une vitesse régulière sur tous les ordinateurs, un déplacement doit être multiplié par `dt`.

```lua
objet.x = objet.x + vitesse * dt
```

## 2. Représenter le joueur

Regroupez ses propriétés dans une table :

```lua
joueur = {
    x = 80,
    y = 0,
    largeur = 40,
    hauteur = 50,
    vitesseY = 0,
    auSol = true
}
```

Pour dessiner un rectangle rempli :

```lua
love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.largeur, joueur.hauteur)
```

## 3. Placer le joueur sur le sol

Si `solY` correspond à la hauteur du sol, le haut du personnage se trouve ici :

```lua
joueur.y = solY - joueur.hauteur
```

Pensez à cette soustraction chaque fois que le personnage retombe.

## 4. Programmer le saut

Une valeur verticale négative déplace le personnage vers le haut :

```lua
if key == "space" and joueur.auSol and not gameOver then
    joueur.vitesseY = -500
    joueur.auSol = false
end
```

Dans `love.update(dt)`, la gravité modifie la vitesse, puis la vitesse modifie la position :

```lua
joueur.vitesseY = joueur.vitesseY + gravite * dt
joueur.y = joueur.y + joueur.vitesseY * dt
```

Lorsque le bas du joueur atteint le sol, replacez-le exactement sur celui-ci, annulez sa vitesse verticale et remettez `auSol` à `true`.

## 5. Déplacer et replacer l'obstacle

```lua
obstacle.x = obstacle.x - obstacle.vitesse * dt
```

Lorsque son bord droit est sorti de l'écran, replacez-le après le bord droit :

```lua
if obstacle.x + obstacle.largeur < 0 then
    obstacle.x = love.graphics.getWidth() + math.random(150, 350)
end
```

## 6. Détecter une collision

Cette fonction vérifie si deux rectangles se chevauchent :

```lua
function collision(a, b)
    return a.x < b.x + b.largeur
       and b.x < a.x + a.largeur
       and a.y < b.y + b.hauteur
       and b.y < a.y + a.hauteur
end
```

Dans `love.update(dt)` :

```lua
if collision(joueur, obstacle) then
    gameOver = true
end
```

Ne mettez à jour le joueur, l'obstacle et le score que si `gameOver` vaut `false`.

## 7. Afficher le score

```lua
score = score + dt
love.graphics.print("Score : " .. math.floor(score), 20, 20)
```

`math.floor` retire les chiffres après la virgule pour obtenir un score entier.

## 8. Recommencer la partie

Créez une fonction qui remet toutes les valeurs à leur état initial :

```lua
function recommencer()
    score = 0
    gameOver = false
    joueur.vitesseY = 0
    joueur.auSol = true
    joueur.y = solY - joueur.hauteur
    obstacle.x = love.graphics.getWidth() + 200
end
```

Appelez-la lorsque `R` est pressée pendant un Game Over :

```lua
if key == "r" and gameOver then
    recommencer()
end
```

## 9. Méthode de débogage

Si le jeu ne fonctionne pas :

1. lisez le message d'erreur et repérez le numéro de ligne ;
2. vérifiez les parenthèses, accolades, guillemets et mots-clés `end` ;
3. affichez temporairement une valeur avec `love.graphics.print` ;
4. testez une seule fonctionnalité à la fois ;
5. vérifiez que les noms des variables sont écrits exactement de la même façon.

## Défis supplémentaires

### Accélérer l'obstacle

Augmentez légèrement sa vitesse au fil du temps :

```lua
obstacle.vitesse = obstacle.vitesse + 5 * dt
```

### Mémoriser le meilleur score

Créez `meilleurScore`. Lors d'une collision, comparez-le au score actuel avec `math.max`.

### Ajouter une couleur

Les valeurs vont de `0` à `1` :

```lua
love.graphics.setColor(0.2, 0.7, 0.3)
```

Remettez ensuite la couleur à blanc si nécessaire :

```lua
love.graphics.setColor(1, 1, 1)
```

