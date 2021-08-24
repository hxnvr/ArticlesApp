# frozen_string_literal: true

module Admin
  class User < ApplicationRecord
    has_secure_password
  end
end
