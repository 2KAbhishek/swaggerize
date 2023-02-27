# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'posts', type: :request do
  path '/posts' do
    get('list posts') do
      tags 'Post'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create post') do
      tags 'Post'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            user_id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          },
          required: %w[user_id title content]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show post') do
      tags 'Post'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            user_id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          }
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update post') do
      tags 'Post'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete post') do
      tags 'Post'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
