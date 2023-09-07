require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user, email: 'rinaudom96@gmail.com', password: 'sebastian10', password_confirmation: 'sebastian10', customer_support: true }

  describe 'validations' do
    describe 'email_field' do
      it { is_expected.to validate_presence_of(:email) }

      valid_emails = ['email@example.com',
                      'firstname.lastname@example.com',
                      'email@subdomain.example.com',
                      'a+b@example.com',
                      'email@example.name',
                      'firstname-lastname@example.com']

      it { is_expected.to allow_values(*valid_emails).for(:email) }

      invalid_emails = ['plainaddress',
                        '#@%^%#$@#$@#.com',
                        '@example.com',
                        'Joe Smith <email@example.com>',
                        'email.example.com',
                        'email@example',
                        'email@@example.com',
                        '”(),:;<>[\]@example.com',
                        'this\ is"really"not\allowed@example.com']

      it { is_expected.not_to allow_values(*invalid_emails).for(:email) }
    end
  end
end