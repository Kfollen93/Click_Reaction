require 'ruby2d'

set background: 'blue'
set title: 'Reaction Clicker'

start_message = Text.new('Reaction Clicker!  Click to Start!')
game_started = false
circle = nil
start_time = nil
duration = nil

on :mouse_down do |event|
if game_started
   if circle.contains?(event.x, event.y)
    duration = ((Time.now - start_time) * 1000).round
    start_message = Text.new("Nice! You took: #{duration} milliseconds! Click to begin.")
    circle.remove
    game_started = false
   end
else
    start_message.remove

    circle = Circle.new(
        x: rand(get(:width) - 25), y: rand(get(:height) - 25),
        size: 25,
        color: 'fuchsia',
        )

        start_time = Time.now
        game_started = true
    end
end

show