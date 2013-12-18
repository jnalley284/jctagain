ActionMailer::Base.smtp_settings = {
  :port           => 587,
  :address        => 'smtp.mailgun.org',
  :user_name      => 'postmaster@justcalltony.com',
  :password       => '0nou28fh7xf8',
  :domain         => 'justcalltony.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp