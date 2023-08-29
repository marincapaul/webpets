class PagesController < ApplicationController
  def home
    if owner_signed_in?
      if current_owner.pets.count>0
        @pet = current_selected
        @current_pets = current_owner.pets.map{ |p| [p.name, p.id] } 
        unless @pet.present?
          @pet = current_owner.pets.first
          select_pet(@pet)
        end
        
        @pagy, @feed_items = pagy_countless(@pet.feed, items: 10)
      end
    else 
      redirect_to new_owner_session_url
    end
  end

  def test
  end
  
end
