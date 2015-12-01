require 'spec_helper'

describe 'home page' do
  it 'should contain' do
    visit '/?foo=butterfly'
    page.should have_content('Search term: butterfly')
  end

  it 'should fail this test' do
    visit '/'
    page.should have_content('Search term: butterfly')
  end
end