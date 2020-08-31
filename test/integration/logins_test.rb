require 'test_helper'

class LoginsTest < ActionDispatch::IntegrationTest
  test 'user can login' do
    user = User.create!(name: 'User', email: 'user@example.org', password: '123456')

    post user_session_path, params: { email: user.email, password: '123456' }

    # User is returned in the response
    assert_equal(json_response['data']['email'], user.email)
    # And headers are set
    assert_not_nil(headers['access-token'])
    assert_not_nil(headers['uid'])
    assert_not_nil(headers['client'])
  end

  test 'employee can login' do
    employee = Employee.create!(name: 'employee', email: 'employee@example.org', password: '123456')
    headers  = { Accept: Api::Constraints::CompanyInterface::MATCHER }

    post employee_session_path, params: { email: employee.email, password: '123456' }, headers: headers

    # Actually emaployee is returned in the response
    assert_equal(json_response['data']['email'], employee.email)
    # But headers are not set
    assert_not_nil(headers['access-token'])
    assert_not_nil(headers['uid'])
    assert_not_nil(headers['client'])
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end
