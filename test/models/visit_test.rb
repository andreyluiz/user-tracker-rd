require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  setup do
    @contact = Contact.create :key => 'my_awesome_key'
  end

  test "should set when field before save" do
    visit = Visit.create :page => 'foo', :contact => @contact
    assert visit.when
  end

  test "should not save without a contact" do
    visit = Visit.new :page => 'foo'
    assert_not visit.save
  end

  test "should save if there is a contact" do
    visit = Visit.new :page => 'foo', :contact => @contact
    assert visit.save
  end

  test "should not save without page" do
    visit = Visit.new :contact => @contact
    assert_not visit.save
  end

  test "should save if there is a page" do
    visit = Visit.new :page => 'foo', :contact => @contact
    assert visit.save
  end

  test "should delete visits if the contact is deleted" do
    @contact.visits.create :page => 'foo'
    @contact.visits.create :page => 'bar'
    visits = @contact.visits
    @contact.destroy
    assert visits.empty?
  end
end
