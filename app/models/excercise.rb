class Excercise < ApplicationRecord
  has_many :user_course_lesson_questions
  has_many :user_course_lesson_answers
  belongs_to :lesson

  scope :ordered_by_title, -> { order excercise_title: :asc }

  validates :excercise_name, presence: true
  # validates :excercise_question, presence: true
  # validates :excercise_answers, presence: true
end

