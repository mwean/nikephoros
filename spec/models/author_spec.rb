require 'spec_helper'

describe Author do
  it { should have_many(:authorships) }
  it { should have_many(:articles).through(:authorships) }
  it { should have_many(:supplements).through(:authorships) }
end
