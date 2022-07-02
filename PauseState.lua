PauseState= Class{__includes = BaseState}

local pause_imag=love.graphics.newImage('Pause.png')
last_score=0
function PauseState:enter(params)
    self.score = params.score
end
function PauseState:update(dt)
   if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('play')
   end
end

function PauseState:render()
    love.graphics.draw(pause_imag,VIRTUAL_WIDTH/2 -25,VIRTUAL_HEIGHT/2 -25)
end