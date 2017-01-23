class ApplicationMailer < ActionMailer::Base
  add_template_helper(EmailHelper)

  default from: "noreply@recipefinder.com"
  layout 'mailer'
  # default 'content-type' => 'text/html'
end
