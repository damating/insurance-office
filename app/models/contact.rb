class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject
  attribute :message

  def headers
    {
      :subject => "#{subject}",
      :to => "mbupolisa.piastow@op.pl",
      :from => %("#{name}" <mbupolisa.piastow@op.pl>)
    }
  end
end
