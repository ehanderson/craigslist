get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/items/new' do
  erb :new
end

post'/items' do
  # @item = Item.create(params[:item])

    erb :new
end









