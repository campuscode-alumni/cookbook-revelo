class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :user
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time, 
            :ingredients, :cook_method, 
            presence: { message: 'não pode ficar em branco' }
  
  enum status: { pending: 0, accepted: 10 }
  
  def cook_time_minutes
    "#{cook_time} minutos"
  end

  def as_json(options = {})
    super(options.merge(include: [:recipe_type], 
                        except: [:recipe_type_id]))
  end
end
