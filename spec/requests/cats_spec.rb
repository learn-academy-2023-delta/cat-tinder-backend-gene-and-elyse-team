require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'gets a list of all cats' do
      Cat.create(
          name: 'Tobey',
          age: 6,
          enjoys: 'Snuggle and tease the dog.',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
      )
      # Make a request to the specific path
      get '/cats'

      cat = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it 'creates a cat' do
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Tobey',
          age: 6,
          enjoys: 'Snuggle and tease the dog.',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }
      # Send the request to the server and pass params which are cat_params
      post '/cats', params: cat_params

      expect(response).to have_http_status(200)

      cat = Cat.first
      
      expect(cat.name).to eq 'Tobey'
      expect(cat.age).to eq 6
      expect(cat.enjoys).to eq 'Snuggle and tease the dog.'
    end
  end

  describe "PATCH /update" do
    it 'updates a cat' do
      # create the cat
      cat_params = {
        cat: {
          name: 'Tobey',
          age: 6,
          enjoys: 'Snuggle and tease the dog.',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }

      post '/cats', params: cat_params
      cat = Cat.first

      # update the cat
      updated_cat_params = {
        cat: {
          name: 'Tobey',
          age: 7,
          enjoys: 'Snuggle and tease the dog.',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params

      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.age).to eq 7
    end
  end
end
