class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_SENDER", "contato@efficio.com.br")

  layout "mailer"
end
