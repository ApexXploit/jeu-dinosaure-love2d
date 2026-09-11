function love.load()
    love.window.setTitle("Jeu du dinosaure")
    love.window.setMode(800, 450)
    math.randomseed(os.time())

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

    joueur.vitesseY = joueur.vitesseY + gravite * dt
    joueur.y = joueur.y + joueur.vitesseY * dt

    if joueur.y + joueur.hauteur >= solY then
        joueur.y = solY - joueur.hauteur
        joueur.vitesseY = 0
        joueur.auSol = true
    end

    obstacle.x = obstacle.x - obstacle.vitesse * dt

    if obstacle.x + obstacle.largeur < 0 then
        obstacle.x = love.graphics.getWidth() + math.random(150, 350)
    end

    score = score + dt

    if collision(joueur, obstacle) then
        gameOver = true
    end
end

function love.draw()
    love.graphics.line(0, solY, love.graphics.getWidth(), solY)

    love.graphics.setColor(0.2, 0.7, 0.3)
    love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.largeur, joueur.hauteur)

    love.graphics.setColor(0.85, 0.25, 0.2)
    love.graphics.rectangle("fill", obstacle.x, obstacle.y, obstacle.largeur, obstacle.hauteur)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score : " .. math.floor(score), 20, 20)

    if gameOver then
        love.graphics.printf("GAME OVER\nAppuyez sur R pour recommencer", 0, 180, love.graphics.getWidth(), "center")
    end
end

function love.keypressed(key)
    if key == "space" and joueur.auSol and not gameOver then
        joueur.vitesseY = -500
        joueur.auSol = false
    end

    if key == "r" and gameOver then
        recommencer()
    end
end

function collision(a, b)
    return a.x < b.x + b.largeur
       and b.x < a.x + a.largeur
       and a.y < b.y + b.hauteur
       and b.y < a.y + a.hauteur
end

function recommencer()
    score = 0
    gameOver = false
    joueur.y = solY - joueur.hauteur
    joueur.vitesseY = 0
    joueur.auSol = true
    obstacle.x = love.graphics.getWidth() + 200
    obstacle.vitesse = 300
end
