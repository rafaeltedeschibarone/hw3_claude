class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry.title = params[:title]
    @entry.description = params[:description]
    @entry.occurred_on = params[:occurred_on]
    @entry.place_id = params[:place_id]

    if @entry.save
      redirect_to("/places/#{@entry.place_id}")
    else
      @place = Place.find(params[:place_id])
      render("entries/new")
    end
  end
end
