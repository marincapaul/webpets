class PagesController < ApplicationController
  def home
    if owner_signed_in?
      @pet = current_selected
      @current_pets = current_owner.pets.map{ |p| [p.name, p.id] } 
      unless @pet.present?
        @pet = current_owner.pets.first
      end
      
      @pagy, @feed_items = pagy_countless(@pet.feed, items: 8)
    end
  end

  def test
  end
  
end
