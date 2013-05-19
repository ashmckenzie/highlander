path = Pathname.new(Rails.root + File.join('app', 'models', 'achievement_calculators'))

require path + 'base'

Dir[File.join(path, 'calculators', '*')].each do |calculator|
  require calculator
end
