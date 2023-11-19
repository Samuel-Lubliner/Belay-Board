# Belay Board

🪢🪢 Software that improves workflow for professionals in the climbing industry 🪢🪢 

⛰️V1 is intended for managing and scheduling clients for climbing instruction and coaching ⛰️

## Add Users with Devise
`rails generate devise User username:citext is_employee:boolean bio:text phone:string profile_picture:string qualifications:text interests:text`

Add unique index, null constraints, and default values

`rails db:migrate`

## Add Availabilities
`rails g scaffold availability user:references start_time:datetime end_time:datetime description:string`

Update migration file and models

# Add Guests
`rails g model Guest user:references availability:references status:string`

Update migration file and models

Guest cant be added to the same availability more than once
`add_index :guests, [:user_id, :availability_id], unique: true`

`rails db:migrate`
