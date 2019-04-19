class Excercise < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, :through => :questions
  belongs_to :lesson
  scope :ordered_by_name, -> { order excercise_name: :asc }

  validates :excercise_name, presence: true
end

