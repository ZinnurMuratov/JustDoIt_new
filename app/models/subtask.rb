class Subtask < ActiveRecord::Base
  belongs_to :tasks


  def completed?
    !completed_at.blank?
  end
end
