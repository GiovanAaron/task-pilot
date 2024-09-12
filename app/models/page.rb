class Page < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'
  has_many :attachments
  has_many :comments

  enum priority: { optional: 0, low_priority: 1, medium_priority: 2, high_priority: 3, critical: 4 }
  enum difficulty: { easy: 0, moderate: 1, challenging: 2, difficult: 3, expert: 4 }
  enum status: { backlog: 0, launch_pad: 1, in_progress: 2, complete: 3, archive: 4 }
  enum reminder: { one_day: 0, two_days: 1, three_days: 2, one_week: 3, one_hour: 4 }
end
