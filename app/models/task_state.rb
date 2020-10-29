class TaskState < ApplicationRecord
  belongs_to :user
  belongs_to :task

  enum level: {
      pending: 0,
      in_progress: 5,
      done: 10
  }
end
