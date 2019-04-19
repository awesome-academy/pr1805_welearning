class Excercise < ApplicationRecord
  has_many :user_course_lesson_questions
  has_many :user_course_lesson_answers
  belongs_to :lesson
end

class Lesson < ApplicationRecord
  has_many :user_course_lessons
  has_many :user_courses, through: :user_course_lessons
  has_many :excercises
  has_many :attachments
  belongs_to :course

  scope :ordered_by_title, -> { order excercise_title: :asc }

  validates :excercise_title, presence: true
  validates :excercise_question, presence: true
  validates :excercise_answers, presence: true
end
