# Belay Board

🪢🪢 Software that improves workflow for professionals in the climbing industry 🪢🪢 

⛰️V1 is intended for managing and scheduling clients for climbing instruction and coaching ⛰️

## Add Users with Devise
`rails generate devise User username:citext is_employee:boolean bio:text phone:string profile_picture:string qualifications:text interests:text`

### add unique index, null constraints, and default values
```ruby
class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # ...

      t.citext :username, null: false, unique: true
      t.boolean :is_employee, default: false, null: false
      t.text :bio
      t.string :phone
      t.string :profile_picture
      t.text :qualifications
      t.text :interests

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :username, unique: true


    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
```
