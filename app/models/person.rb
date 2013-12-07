class Person < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable
  belongs_to :people, class_name: 'Person', foreign_key: :person_id
  has_one :person, class_name: 'Person', foreign_key: :person_id
  validates_uniqueness_of :username
  validates_presence_of :username, :first_name, :last_name

  def self.secret_santa
    while true
      giftee = self.where(:is_selected => false).first(:order => 'RANDOM()')
      return unless giftee
      gifter = self.where(:person_id => nil).where.not(:id => giftee.id).first(:order => 'RANDOM()')
      return unless gifter
      gifter.person_id   = giftee.id
      giftee.is_selected = true
      giftee.save!
      gifter.save!
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
