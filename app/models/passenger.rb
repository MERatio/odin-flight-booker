class Passenger < ApplicationRecord
  belongs_to :booking, inverse_of: :passengers

  before_save :downcase_email

  validates_presence_of :booking
  validates :name,       presence: true, length: { in: 2..60 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email,      presence: true, length: { maximum: 50 },
                         format: { with: VALID_EMAIL_REGEX },
                         uniqueness: { case_sensitive: false }
                         
  private

    def downcase_email
      email.downcase!
    end
end
