Rails.application.routes.draw do
  get 'welcome/index'   #对welcome/index的访问请求应该发往welcome控制器的index动作
  resources :articles do
  	resources :comments
  end
  	#资源是一个术语，表示一系列类似对象的集合，如文章、人或动物。资源中的项目可以被创建
  				   #、读取、更新和删除，这些操作简称 CRUD（Create, Read, Update, Delete）。
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
