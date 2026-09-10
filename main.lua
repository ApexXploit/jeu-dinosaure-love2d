-- Projet LÖVE2D : jeu du dinosaure
-- Complétez les zones TODO dans l'ordre indiqué dans le README.

function love.load()
    love.window.setTitle("Jeu du dinosaure")
    love.window.setMode(800, 450)

    solY = 380
    gravite = 1200
    score = 0
    gameOver = false

    joueur = {
        x = 80,
        y = solY - 50,
        largeur = 40,
        hauteur = 50,
        vitesseY = 0,
        auSol = true
    }

    obstacle = {
        x = 800,
        y = solY - 50,
        largeur = 30,
        hauteur = 50,
        vitesse = 300
    }
end

function love.update(dt)
    if gameOver then
        return
    end

    -- TODO 1 : appliquer la gravité au joueur.
    -- TODO 2 : modifier la position verticale du joueur.
    -- TODO 3 : empêcher le joueur de traverser le sol.
    -- TODO 4 : déplacer l'obstacle vers la gauche avec dt.
    -- TODO 5 : replacer l'obstacle lorsqu'il quitte l'écran.
    -- TODO 6 : augmenter le score avec dt.
    -- TODO 7 : tester la collision et déclencher le Game Over.
end

function love.draw()
    -- Le sol
    love.graphics.line(0, solY, love.graphics.getWidth(), solY)

    -- Le joueur
    love.graphics.setColor(0.2, 0.7, 0.3)
    love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.largeur, joueur.hauteur)

    -- L'obstacle
    love.graphics.setColor(0.85, 0.25, 0.2)
    love.graphics.rectangle("fill", obstacle.x, obstacle.y, obstacle.largeur, obstacle.hauteur)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score : " .. math.floor(score), 20, 20)

    if gameOver then
        love.graphics.printf("GAME OVER\nAppuyez sur R pour recommencer", 0, 180, love.graphics.getWidth(), "center")
    end
end

function love.keypressed(key)
    -- TODO 8 : faire sauter le joueur avec Espace s'il est au sol.
    -- TODO 9 : appeler recommencer() avec R après un Game Over.
end

function collision(a, b)
    -- TODO 10 : retourner true lorsque les deux rectangles se chevauchent.
    return false
end

function recommencer()
    -- TODO 11 : réinitialiser le score, le joueur, l'obstacle et gameOver.
end

