# First passing solution

def organizingContainers(container)
  container_balls = []
  coloured_balls = []

  # Swap containers and types axis around to find the number of coloured balls
  transposed_container = container.transpose
  container.length.times do |i|
      coloured_balls << transposed_container[i].sum
      # Count the number of balls in each container
      container_balls << container[i].sum
  end

  if coloured_balls.sort == container_balls.sort
      p "Possible"
  else
      p "Impossible"
  end
end
