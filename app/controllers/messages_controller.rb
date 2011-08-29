class MessagesController < InheritedResources::Base
  
  # before_filter :authenticate_user!
  after_filter :send_to_pusher
  
  def new
    @message = Message.new  
    @message.category_id = 1
    new!
  end

  def create
    @message = Message.new(params[:message])
    @message.category_id = 1
    create! { root_path }
  end
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  private
  
  def send_to_pusher
    if @message.errors.empty?
      Pusher['alpha-kato'].trigger!('message:create', {:id => @message.id, :title => @message.title, :content => @message.content, :votes_count => @message.votes_count})
    end
  end
  
end
