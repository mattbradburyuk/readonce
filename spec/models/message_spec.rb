require 'spec_helper'

describe Message do
  #pending - stuff you are going to do - don;t use
  pending "add some examples to (or delete) #{__FILE__}"
  

  # {} Defines a block, used in stead of do end
  # validates_presence_of is from shoulda-matchers
  it {should validate_presence_of :body }
  it {should belong_to :sender}
  it {should belong_to :receiver}
  it {should validate_presence_of :receiver_id }
  

  
  
end
