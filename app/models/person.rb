class Person < ActiveRecord::Base
  has_one :person
  belongs_to :person

  def self.secret_santa
    self.all.each do |s|
      s.is_selected = false
      s.person      = nil
    end
    while true
      giftee = self.where(:is_selected => false).first(:order => 'RANDOM()')
      return unless giftee
      gifter = self.where(:person_id   => nil).where.not(:id => giftee.id).first(:order => 'RANDOM()')
      return unless gifter
      p 'gifter ' << gifter.first_name.to_s
      p 'giftee ' << giftee.first_name.to_s
      gifter.person_id   = giftee.id
      giftee.is_selected = true
      giftee.save!
      gifter.save!
    end
  end
end
