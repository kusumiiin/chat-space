== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
___
messages_table
___
| *column* |  *type*  |
|:---------|---------:|
|body      |text      |
|image     |string    |
|group_id  |integer   |
|user_id   |integer   |
___
users_table
___
| *column* |  *type*  |
|:---------|---------:|
|email     |string    |
|password  |string    |
|nickname  |string    |
email null:false  
add_index :users, :email  
password null:false
___
groups_table
___
| *column* |  *type*  |
|:---------|---------:|
|name      |string    |
___
groups_users_table
___
| *column* |  *type*  |
|:---------|---------:|
|user_id   |integer   |
|group_id  |integer   |

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
