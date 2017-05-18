class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "hch", password: "159753", except: [:index, :show]
	def new
		puts "你访问了Articles的new"
		#if(@article==nil)
			@article=Article.new
		#end
	end
	def create
		#render 给予 plain绝对 inspect检查
		#这里 render 方法接受了一个简单的散列（hash）作为参数，:plain 键的值是 params[:article].inspect。
		#params 方法是代表表单提交的参数（或字段）的对象。params 方法返回 ActionController::Parameters 对象，
		#这个对象允许使用字符串或符号访问散列的键。这里我们只关注通过表单提交的参数。
		@article = Article.new(params.require(:article).permit(:title,:text));
		if @article.save
			redirect_to @article
		else
			render 'new'  #重定向
			puts 'save失败'
			#注意在 create 动作中，当 save 返回 false 时，
			#我们用 render 代替了 redirect_to。使用 render 方法是为了
			#把 @article 对象回传给 new 模板。这里渲染操作是在提交表单的这个请求中完成的，
			#而 redirect_to 会告诉浏览器发起另一个请求。
		end

		#render(plain: params[:article].inspect);
		puts "你访问了create"
	end
	def edit
		#@article=Article.new;
		@article=Article.find(params[:id]);
	end
	def update
  		@article = Article.find(params[:id])
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
    	end
  	end
	def show
		@article=Article.find(params[:id]);
	end
	def index
		@articles=Article.all
	end
	def destroy
		@article = Article.find(params[:id])
    	@article.destroy
    	redirect_to articles_path
	end
	#----------------------------------------
private
    def article_params
    	params.require(:article).permit(:title, :text)
    end

end

