# frozen_string_literal: true

class AddPublishedAtToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :published_at, :datetime
  end
end
