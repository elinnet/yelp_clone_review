require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }
end
