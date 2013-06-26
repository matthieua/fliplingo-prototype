class Flip < ActiveRecord::Base
  belongs_to :user

  def friendly_kind
    if kind == 'mt'
      'machine'
    else
      'human'
    end
  end
end
