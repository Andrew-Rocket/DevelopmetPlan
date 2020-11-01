# frozen_string_literal: true

class ExportPlanJob < ApplicationJob
  queue_as :default

  def perform(email, plan)
    ExportMailer.send_plan_as_pdf(email, plan).deliver_now
  end
end
