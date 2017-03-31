class Calculator < MailForm::Base
  zip_regex_pl = %r{\d{2}-\d{3}}

  attribute :brand,                           :validate => true
  attribute :model,                           :validate => true
  attribute :capacity,                        :validate => true
  attribute :power,                           :validate => true
  attribute :year,                            :validate => true
  attribute :registered_zipcode,              :validate => true, format: { :with => zip_regex_pl }, message: "Wymagany format 00-000"
  attribute :owner_birth
  attribute :driving_licence_issue_date,      :validate => true
  attribute :previous_insurance_company
  attribute :last_policy_discount
  attribute :last_year_damage_amount
  attribute :vin,                             :validate => true
  attribute :pesel
  attribute :contact_name,                    :validate => true
  attribute :email,                           :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone_number

  validates :pesel, presence: true, length: { is: 11 }


  def headers
    {
      :subject => "Obliczenie OC",
      :to => "mbupolisa.piastow@op.pl",
      :from => %("#{contact_name}" <mbupolisa.piastow@op.pl>)
    }
  end

  def self.format_date(hash, field)
    Time.zone.local(*(1..3).map { |i| hash["#{field}(#{i}i)"] }).strftime("%d-%m-%Y")
  end
end
