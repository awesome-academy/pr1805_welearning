class Question < ApplicationRecord
  belongs_to :excercise
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers,
    :reject_if => proc { |attributes| attributes[:answer_content].blank? },
    :allow_destroy => true, limit: 4

  scope :ordered_by_title, -> { order lesson_title: :asc }
end
