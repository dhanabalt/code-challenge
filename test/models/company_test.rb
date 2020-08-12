require 'test_helper'
class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = companies(:hometown_painting)
  end

  test 'valid without email' do
    @company.email = nil
    assert @company.valid?
  end

  test 'invalid with invalid email' do
    @company.email = "hometown_painting@hometown_painting.com"
    refute @company.valid?, 'company is valid with invalid email'
    assert_not_nil @company.errors[:email], 'no validation error for email present'
  end

  test '#set_state_and_city - set state and city on valid zip_code' do
    @company.save
    assert_not_nil @company.city
    assert_not_nil @company.state
  end

  test '#set_state_and_city - update state and city on valid zip_code' do
    @company.save
    city = @company.city
    state = @company.state
    @company.update(zip_code: '37201')
    assert_not_equal city, @company.city
    assert_not_equal state, @company.state
  end
end