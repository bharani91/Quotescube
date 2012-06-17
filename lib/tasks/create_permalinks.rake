desc "Create permalinks"
task :create_permalinks => :environment do
  require "rufus-mnemo"
  Quote.where(:permalink => nil).each do |quote|
    quote.permalink = Rufus::Mnemo.from_i(rand(12**5))
    quote.save
  end
end



