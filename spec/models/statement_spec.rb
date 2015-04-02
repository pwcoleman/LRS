require 'rails_helper'

RSpec.describe Statement, type: :model do
  it { is_expected.to validate_presence_of :lrs }
end
