module SessionsHelper

  # selects the given pet
  def select_pet(pet)
    session[:pet_id] = pet.id
  end

  # returns the selected pet (if any)
  def current_selected
    if session[:pet_id]
      @current_selected ||= Pet.find_by(id: session[:pet_id])
    end
  end

  # Returns true if a pet is selected, false otherwise
  def selected_pet?
    !current_selected.nil?
  end

end
