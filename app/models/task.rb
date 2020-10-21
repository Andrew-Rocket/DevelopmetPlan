class Task < ApplicationRecord
  belongs_to :plan

  enum level: {
      trainee: 0,
      junior: 1,
      middle: 5,
      senior: 10
  }
end
