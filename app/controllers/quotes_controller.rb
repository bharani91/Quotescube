class QuotesController < ApplicationController
  # GET /quotes
  # GET /quotes.json
  def index
    @quote = Quote.first(:offset => rand(Quote.count))
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find_by_permalink(params[:short_link])
    @next_quote = Quote.find_by_permalink(params[:short_link])
    @authors = Quote.uniq.pluck(:author)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote }
    end
  end
  
  # GET /author/:name
  # GET /author/:name.json
  def quotes_by_author
    @quotes = Quote.where(:author_slug => params[:name]).paginate(:page => params[:page], :per_page => 15)
    @author = @quotes.first.author unless @quotes.empty?
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @quote }
    end
  end
  
  # GET /category/:cat
  # GET /category/:cat.json
  def quotes_by_category
    @quotes = Quote.where(:category => params[:cat]).paginate(:page => params[:page], :per_page => 21)
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @quote }
    end
  end


end
