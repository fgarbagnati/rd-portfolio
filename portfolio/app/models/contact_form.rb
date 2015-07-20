class ContactForm < MailForm::Base
  attribute :name,        :validate => true
  attribute :email,       :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :company
  attribute :message,     :validate => true

  def headers
    {
      :subject => "New Message",
      :to => "f.g.garbagnati@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
