desc "Create author slug"
task :create_author_slug => :environment do
  class String
    def multisub(key_value_pairs=[].freeze)
      regexp_fragment = key_value_pairs.collect { |k, v| k }
      gsub(Regexp.union(*regexp_fragment)) do |m|
        key_value_pairs.detect { |k, v| k =~ m }[1]
      end
    end
  end
  
  Quote.all.each do |quote|
    unless quote.author.nil?
      quote.author_slug = quote.author.multisub([[/[^0-9a-z ]/i, ''], [/\s/, "_"]]).downcase
      quote.save
    end
  end
end



