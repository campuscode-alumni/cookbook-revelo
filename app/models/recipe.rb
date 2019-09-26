class Recipe < ApplicationRecord

  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time, 
            :ingredients, :cook_method, 
            presence: { message: 'não pode ficar em branco' }
  
  def cook_time_minutes
    "#{cook_time} minutos"
  end
end
