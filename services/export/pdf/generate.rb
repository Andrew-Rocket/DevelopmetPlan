class Export::Pdf::Generate < ApplicationService
  def self.call
    new.call
  end

  def call
    generate_pdf
  end

  private

  def generate_pdf
    WickedPdf.new.pdf_from_string(
        ActionController::Base.new.render_to_string('pdf/plan.html.haml', layout: 'pdf.html.haml', locals: {plan: plan})
    )
  end
end
