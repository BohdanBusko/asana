module Account::TasksHelper
  def tasks_by(section)
    section.tasks.order(row_order: :asc)
  end
end
