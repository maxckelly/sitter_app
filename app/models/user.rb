class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable

  belongs_to :role
  has_one :parent
  has_one :sitter
  has_one_attached :picture
  has_many :meetings


  validates :fullname, presence: true, length: {maximum: 50}

  def generate_pin
    # The below generates a random number, sets the phone_verified to false and saves it
    self.pin = SecureRandom.hex(2)
    self.phone_verified = false
    save
  end

  # Once we have a new number we will generate a pin and send that number
  def send_pin
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '+12015845277',
      to: self.phone_number,
      body: "Your pin is #{self.pin}"
    )
  end

  # This then updates the phone_verified to true
  def verify_pin(entered_pin)
    update(phone_verified: true) if self.pin == entered_pin
  end
end
