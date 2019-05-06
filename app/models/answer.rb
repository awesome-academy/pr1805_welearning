class Answer < ApplicationRecord
  belongs_to :question

  def is_correct
    self.is_correct = Answer.is_correct(true)
    update_attribute :is_correct, Answer.is_correct(true)
  end
end
