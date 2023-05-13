class Contact < MailForm::Base
  attribute :name, validate: true

  attribute :email, validate: /\A([\w+-].?)+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i

  attribute :file, attachment: true

  attribute :message

  attribute :nickname, captcha: true

  def headers
    {

      subject: 'Regarding MailForm',

      to: 'chitradevi@vakilsearch.com',

      from: %("#{name}" <#{email}>)

    }
  end
end
