class Mock < ActiveRecord::Base
  has_many :teams
  has_many :picks, through: :teams
  def round_count
    qb + rb + wr + te + k + dst + rbwr + rbwrte + qbrbwrte + bn
  end
end
