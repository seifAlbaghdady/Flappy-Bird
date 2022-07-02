ScoreState = Class{__includes = BaseState}
max=0
second=0
third=0
medal_imag=love.graphics.newImage('medal.png')
silver_imag=love.graphics.newImage('silver.png')
bronze_imag=love.graphics.newImage('bronze.png')
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.setFont(flappyFont)
    if(self.score==0) then
        love.graphics.printf('GG! Try Again', 0, 64, VIRTUAL_WIDTH, 'center')
    elseif(self.score>=max) then
        love.graphics.draw(medal_imag,VIRTUAL_WIDTH/2 -40,VIRTUAL_HEIGHT/2 -15)
        max=self.score
    elseif (self.score>=second) then
        love.graphics.draw(silver_imag,VIRTUAL_WIDTH/2 -40,VIRTUAL_HEIGHT/2 -15)
        second=self.score
    elseif (self.score>=third) then
        love.graphics.draw(bronze_imag,VIRTUAL_WIDTH/2 -40,VIRTUAL_HEIGHT/2 -15)
        third=self.score
    else
        love.graphics.printf('GG! Try Again', 0, 64, VIRTUAL_WIDTH, 'center')
    end
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end