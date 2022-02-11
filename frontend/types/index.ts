
export interface User {
  id?: number;
  uid: string;
  sex: string;
  age: number;
}

export interface Topic {
  id?: number;
  category_id: number;
  title: string;
  description: string;
  sex?: string;
  age?: number;
  option_1: string;
  option_2: string;
  option_3?: string;
  option_4?: string;
  option_1_num: number;
  option_2_num: number;
  option_3_num?: number;
  option_4_num?: number;
  timestamp?: Date;
  img_path?: string;
}

export interface Comment {
  id?: number;
  user_id: number;
  text: string;
  like_num?: number;
  parent_id?: number;
  timestamp?: Date;
}

export interface Category {
  id: number;
  category: null | string;
}

