rails generate model User ^
username:string sex:string age:integer ^
&& ^
rails generate model Topic ^
category_id:integer title:string description:text ^
option_1:string option_2:string option_3:string option_4:string ^
option_1_num:integer option_2_num:integer option_3_num:integer option_4_num:integer ^
sex:string age:integer ^
img_path:string timestamp:string user:references ^
&& ^
rails generate model Comment ^
parent_id:integer text:text like_num:integer ^
timestamp:string user:references topic:references ^
&& ^
rails generate model Like ^
user:references comment:references ^
&& ^
rails generate model Vote ^
user:references topic:references

