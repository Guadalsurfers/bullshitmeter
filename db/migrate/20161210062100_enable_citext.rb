class EnableCitext < ActiveRecord::Migration[5.0]
  def change
    enable_extension :citext
  end
end
