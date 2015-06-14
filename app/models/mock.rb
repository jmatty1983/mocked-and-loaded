class Mock < ActiveRecord::Base
  has_many :picks

  def round_count
    qb + rb + wr + te + k + dst + rbwr + rbwrte + qbrbwrte + bn
  end
end
