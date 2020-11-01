# frozen_string_literal: true

class ExportMailer < ApplicationMailer
  default from: 'example@example.com'

  def send_plan_as_pdf(email, plan)
    pdf = WickedPdf.new.pdf_from_string(
      ActionController::Base.new.render_to_string('pdf/plan.html.haml', layout: 'pdf.html.haml', locals: { plan: plan })
    )

    attachments['plan.pdf'] = { mime_type: 'application/pdf',
                                content: pdf }
    mail(to: email, subject: 'PDF plan', template_name: 'send_plan_as_pdf')
  end
end
