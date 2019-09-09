require "./simulator"

namespace :orchard do
  desc "Play game many times with best strategy to see probabilities"
  task :simulate do
    Simulator.go!
  end

  desc "Simulate game with each strategy to see probabilities"
  task :all do
    Simulator.try_all!
  end

  desc "Play game one time with turn output and see who wins"
  task :single do
    Simulator.single!
  end
end
