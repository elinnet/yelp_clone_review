require 'spec_helper'

describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }
end
