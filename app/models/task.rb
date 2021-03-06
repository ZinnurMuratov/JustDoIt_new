class Task < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  has_many   :subtasks, dependent:  :destroy


end
