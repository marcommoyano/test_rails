class Character < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :color
  
  validates :name, presence: true
  validates :color_id, presence: true
  validates :type_id, presence: true

  attr_writer :current_step

  def step_name?
    current_step == "name"
  end
  
  def step_color?
    current_step == "color"
  end

  def step_type?
    current_step == "type"
  end

  def current_step
    @current_step.presence || steps.first
  end
  
  def steps
    %w[name color type]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end  

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def character_params
    params.permit(:name, :color, :type_id)
  end
  
end