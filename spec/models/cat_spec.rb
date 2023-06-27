require 'rails_helper'

# cat = Cat.create(
#   name: 'Tobey',
#   age: 6,
#   enjoys: 'Snuggle and tease the dog.',
#   image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
# )

RSpec.describe Cat, type: :model do
  it 'should validate name' do 
    cat = Cat.create(
      age: 6,
      enjoys: 'Snuggle and tease the dog.',
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  )
  # If cat's name field is empty, we need to check that an error is thrown
    expect(cat.errors[:name]).to_not be_empty
    expect(cat.errors[:name]).to include "can't be blank"
  end

  it 'should have an age' do 
    cat = Cat.create(
      name: 'Tobey',
      enjoys: 'Snuggle and tease the dog.',
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
    )
    expect(cat.errors[:age]).to_not be_empty
    expect(cat.errors[:age]).to include "can't be blank"
  end

  it 'should enjoy something' do 
    cat = Cat.create(
      name: 'Tobey',
      age: 6,
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
    expect(cat.errors[:enjoys]).to include "can't be blank"
  end
end
