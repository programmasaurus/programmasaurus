Rake::Task["assets:environment"].clear

namespace :assets do
  task :environment do
    Bundler.require(:assets)
  end
end
