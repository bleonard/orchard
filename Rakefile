require "./simulator"

namespace :orchard do
  desc "Play orchard many times"
  task :simulate do
    Simulator.go!
  end

  task :all do
    Simulator.try_all!
  end

  task :single do
    Simulator.single!
  end
end
