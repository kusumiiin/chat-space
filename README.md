== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
5
* Database creation
___
messages
___
| *column* |  *type*  |
|:---------|---------:|
|body      |text      |
|image     |string    |
|group_id  |references|
|user_id   |references|  
belongs_to :user  
belongs_to :group
___
users
___
| *column* |  *type*  |
|:---------|---------:|
|nickname  |string    |  
email null:false  
add_index :users, :email  
password null:false  
nickname null:false  
add_index :users, :nickname, unique: true  
has_many :messages  
has_many :group_users  
has_many :groups, through: :group_users
___
groups
___
| *column* |  *type*  |
|:---------|---------:|
|name      |string    |  
name null:false  
has_many :messages  
has_many :group_users  
has_many :users, through: :group_users
___
group_users
___
| *column* |  *type*  |
|:---------|---------:|
|user_id   |references|
|group_id  |references|  
belongs_to :user  
belongs_to :group
___



