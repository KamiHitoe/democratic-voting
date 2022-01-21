
rails generate model Topic ^
user_id:integer category_id:integer title:string description:text ^
option_1:string option_2:string option_3:string option_4:string ^
option_1_num:string option_2_num:string option_3_num:string option_4_num:string ^
img_path:string

rails generate model Comment ^
user_id:integer parent_id:integer text:text like_num:integer ^
topic:references

