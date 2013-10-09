get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/categories' do
  @categories = Category.all
  erb :categories
end



get '/categories/:id' do
  @category = Category.find(params[:id])
  # @items = Category.find(params[:id]).posts
  @posts = Post.where(:category_id => @category.id.to_s)
  erb :list_cat_posts

end

post'/categories' do
  # @item = Item.create(params[:item])
  search_string = params[:user_input].downcase

  @categories = Category.where("name LIKE '%#{search_string}%'")
  @category = @categories.first
  @posts = @category.posts

  erb :list_cat_posts
 end

post'/posts' do
  search_string = params[:user_input].downcase

  @posts = Post.where("name LIKE '%#{search_string}%'")
  @post = @posts.first

  erb :list_post

end

get '/posts/:id' do
  @selected_item = Post.find(params[:id])

  erb :list_post
end  



post '/post/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect to ('/')
end






