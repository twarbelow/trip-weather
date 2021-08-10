require 'rails_helper'

RSpec.describe Background do
  describe 'initialize' do
    it 'has expected attributes' do
      data = {
                description: "Night Time Downtown Denver",
                urls:
                 { full: "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI2MjR8MHwxfHNlYXJjaHwxfHxjaXR5JTIwb2YlMjBkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg1NzAwODk&ixlib=rb-1.2.1&q=85" },
                user:
                 {name: "Ryan De Hamer",}
              }

      object = Background.new(data, "denver,co")

      expect(object).to have_attributes(location: "denver,co", description: data[:description], image_url: data[:urls][:full], credit: {source: "unsplash.com", author: data[:user][:name]})
    end
  end
end
