require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    @contact = Contact.new
  end

  test "should not save without key" do
    assert_not @contact.save
  end

  test "should save if there is a key provided" do
    @contact.key = 'my_awesome_key'
    assert @contact.save
  end

  test "should not save if there is a duplicated contact key" do
    @contact.key = 'my_awesome_key'
    assert @contact.save
    contact = Contact.new :key => 'my_awesome_key'
    assert_not contact.save
  end
end
