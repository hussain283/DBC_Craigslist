get '/' do
  @categories = Category.all
  erb :index
end

# Category Routes
get '/category/new' do
  erb :new_category
end

post '/category/create' do
  @category = Category.create(params[:category])
  redirect '/'
end

get '/category/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  erb :show_category
end

# Post Routes
get '/category/:category_id/post/new' do
  @category = Category.find(params[:category_id])
  @post = Post.new
  erb :form_post
end

post '/category/:category_id/post/create' do
  @post = Post.create(params[:post])
  @category = Category.find(params[:category_id])
  redirect "/token/#{@post.token}"
end

get "/token/:token" do
  @post = Post.find_by_token(params[:token])
  erb :unique_token
end

get '/category/:category_id/post/edit/:token' do
  @category = Category.find(params[:category_id])
  @post = Post.where(token: params[:token]).first
  erb :form_post 
end

put '/category/:category_id/post/update/:post_id' do
  @post = Post.find(params[:post_id])
  @post.update_attributes(params[:post])

  redirect "/"
end

get '/category/:category_id/post/:id' do
  @category = Category.find(params[:category_id])
  @post = Post.find(params[:id])
  erb :show_post
end

