class ExportMailer < ApplicationMailer
  default from: 'example@example.com'

  def send_plan_as_pdf(email)
    pdf = WickedPdf.new.pdf_from_string(
        ActionController::Base.new.render_to_string('pdf/plan.html.haml', layout: 'pdf.html.haml', locals: {plan: Plan.last})
    )
    attachments['plan.pdf'] = {mime_type: 'application/pdf',
                               content: pdf}
    mail(to: email, subject: 'PDF plan', template_name: 'send_plan_as_pdf')
  end
end