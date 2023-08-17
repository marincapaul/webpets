class PagesController < ApplicationController

  def home
    if owner_signed_in?
      @current_pets = current_owner.pets.map{ |p| [p.name, p.id] } 
      @pet = current_owner.pets.first
      @pagy, @feed_items = pagy_countless(@pet.feed, items: 8)
    end
  end

  def test
  end
  
end
