# == Schema Information
#
# Table name: rockles
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  species    :string(255)      not null
#  user_id    :integer          not null
#  level      :integer          default(1)
#  exp        :integer          default(0)
#  max_hp     :integer
#  hp_points  :integer          default(0)
#  atk_points :integer          default(0)
#  def_points :integer          default(0)
#  spd_points :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Rockle < ActiveRecord::Base
  SPECIES = %w(a b c d e)
  validates :species, presence: true, inclusion: SPECIES
  validates :name, :user_id, presence: true

  belongs_to :user

  after_create :roll_stats
  after_create :compute_stats


  private

  def compute_stats
    self.update_attribute(:max_hp, self.hp_points * 10)
  end

  def roll_stats
    attr_hash = {hp_points: "", atk_points: "", def_points: "", spd_points: ""}
    %w(hp_points atk_points def_points spd_points).each do |attr|
      attr_hash[attr] = rand(5..10)
    end
    self.update_attributes(attr_hash)
  end

end
