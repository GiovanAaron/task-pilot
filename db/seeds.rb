# db/seeds.rb

# Seed Users
user1 = User.create(name: "Mark Scout", profile_img: "mark_scout.jpg")
user2 = User.create(name: "Helly R.", profile_img: "helly_r.jpg")

# Seed Pages
page1 = Page.create(
  name: "Severance Procedure",
  description: "Documentation of the severance procedure and its implications.",
  due_by: Date.today + 10.days,
  priority: :high_priority,
  difficulty: :difficult,
  status: :in_progress,
  progress: 50,
  reminder: :two_days,
  users_id: user1.id
)

page2 = Page.create(
  name: "Employee Well-being Report",
  description: "Report on employee well-being and psychological effects.",
  due_by: Date.today + 20.days,
  priority: :medium_priority,
  difficulty: :moderate,
  status: :backlog,
  progress: 0,
  reminder: :one_week,
  users_id: user2.id
)

# Additional Pages for Mark Scout
page3 = Page.create(
  name: "Internal Memo: New Procedures",
  description: "Memo detailing the new internal procedures affecting employees.",
  due_by: Date.today + 15.days,
  priority: :medium_priority,
  difficulty: :moderate,
  status: :in_progress,
  progress: 30,
  reminder: :three_days,
  users_id: user1.id
)

page4 = Page.create(
  name: "Confidential Employee Feedback",
  description: "A compilation of anonymous feedback from employees about the work environment.",
  due_by: Date.today + 25.days,
  priority: :low_priority,
  difficulty: :easy,
  status: :backlog,
  progress: 0,
  reminder: :one_week,
  users_id: user1.id
)

page5 = Page.create(
  name: "Severance Impact Assessment",
  description: "Assessment of the impact of the severance process on employee performance and satisfaction.",
  due_by: Date.today + 30.days,
  priority: :high_priority,
  difficulty: :difficult,
  status: :backlog,  # Adjusted from :not_started to :backlog
  progress: 0,
  reminder: :one_week,  # Adjusted to fit defined enum values
  users_id: user1.id
)

# Additional Pages for Helly R.
page6 = Page.create(
  name: "Workplace Efficiency Analysis",
  description: "Analysis of workplace efficiency and the impact of severance on productivity.",
  due_by: Date.today + 12.days,
  priority: :high_priority,
  difficulty: :moderate,
  status: :in_progress,
  progress: 40,
  reminder: :three_days,  # Adjusted to fit defined enum values
  users_id: user2.id
)

page7 = Page.create(
  name: "Training Materials Review",
  description: "Review of training materials provided to new employees post-severance.",
  due_by: Date.today + 22.days,
  priority: :medium_priority,
  difficulty: :easy,
  status: :backlog,
  progress: 0,
  reminder: :one_week,
  users_id: user2.id
)

page8 = Page.create(
  name: "Protocol for Employee Integration",
  description: "Protocols and guidelines for integrating employees back into their roles after the severance procedure.",
  due_by: Date.today + 35.days,
  priority: :low_priority,
  difficulty: :moderate,
  status: :backlog,  # Adjusted from :not_started to :backlog
  progress: 0,
  reminder: :one_week,  # Adjusted to fit defined enum values
  users_id: user2.id
)

# Seed Attachments
Attachment.create(file_path: "severance_procedure_manual.pdf", pages_id: page1.id)
Attachment.create(file_path: "employee_wellbeing_report.pdf", pages_id: page2.id)
Attachment.create(file_path: "internal_memo_new_procedures.pdf", pages_id: page3.id)
Attachment.create(file_path: "confidential_employee_feedback.pdf", pages_id: page4.id)
Attachment.create(file_path: "severance_impact_assessment.pdf", pages_id: page5.id)
Attachment.create(file_path: "workplace_efficiency_analysis.pdf", pages_id: page6.id)
Attachment.create(file_path: "training_materials_review.pdf", pages_id: page7.id)
Attachment.create(file_path: "protocol_employee_integration.pdf", pages_id: page8.id)

# Seed Comments
Comment.create(
  user: "Mark Scout",
  title: "Procedure Concerns",
  posted_at: Date.today,
  body: "We need to review the psychological impact of the severance procedure more closely.",
  attachment: "procedure_concerns.txt",
  pages_id: page1.id
)

Comment.create(
  user: "Mark Scout",
  title: "Memo Update",
  posted_at: Date.today,
  body: "The new procedures outlined in the memo need clarification on implementation details.",
  attachment: "memo_update.txt",
  pages_id: page3.id
)

Comment.create(
  user: "Mark Scout",
  title: "Feedback Review",
  posted_at: Date.today,
  body: "Anonymous feedback points to growing dissatisfaction with the severance process.",
  attachment: "feedback_review.txt",
  pages_id: page4.id
)

Comment.create(
  user: "Helly R.",
  title: "Report Observations",
  posted_at: Date.today,
  body: "The report is lacking some crucial data on employee mental health.",
  attachment: "report_observations.txt",
  pages_id: page2.id
)

Comment.create(
  user: "Helly R.",
  title: "Efficiency Analysis Insights",
  posted_at: Date.today,
  body: "Initial findings suggest that severance may be impacting overall efficiency in unexpected ways.",
  attachment: "efficiency_analysis_insights.txt",
  pages_id: page6.id
)

Comment.create(
  user: "Helly R.",
  title: "Training Materials Gaps",
  posted_at: Date.today,
  body: "The training materials need to address gaps related to post-severance adaptation.",
  attachment: "training_materials_gaps.txt",
  pages_id: page7.id
)
