# First passing solution
# Brute force - fails time checks
def poisonousPlants(p)
  plants = [0] + p
  days = 0
  plants_dead = [0]

  while plants_dead.length > 0
      plants_dead = []
      plants_alive = []
      (plants.length - 1).downto(1) do |index|
          # ignore the left most plant
          if index == 1
              plants_alive.push(plants[index])
          elsif plants[index] > plants[index - 1]
              plants_dead.push(plants[index])
          else
              plants_alive.push(plants[index])
          end
      end

      if plants_dead.length > 0
          # I can pop/ push plants_alive but reverse will do the job here
          plants = [0] + plants_alive.reverse
          days += 1
      end
  end

  days
end
