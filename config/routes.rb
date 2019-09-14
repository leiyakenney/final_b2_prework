Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students, only: [:show], as: :student_show

  resources :courses, only: [:show], as: :course_show

end
