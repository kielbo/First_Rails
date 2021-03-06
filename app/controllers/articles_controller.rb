class ArticlesController < ApplicationController
before_action :set_article, only:[:edit,:update,:show,:destroy]
before_action :require_user, except: [:index, :show] #zablokuje dostep do wszystkich funkcji oprocz inex i show dla nie zalogowanego uzytkownika
before_action :require_same_user, only:[:edit,:update,:destroy]
def index
  @articles = Article.paginate page:params[:page],per_page:5
end

def destroy
  @article.destroy
  flash[:notice] = "Article was succesfully destoyed"
  redirect_to articles_path
end

  def new
    @article = Article.new #Do zmiennej article przypisujemy model Article narazie
    #wszystkie wartości będą mieć wartość nill
  end

def create
  @article = Article.new(article_params)
  #Tutaj tworzymy nowy article z danych bedacych w params strony
  if @article.save
    flash[:notice] = "Article was successfully created"
    redirect_to article_path(@article)
=begin
Sprawdzamy czy artukul zostal zapisany prostym ifem , jesli operacja sie powiodla zostanie wyswietlona o tym informacja na ekranie, nastepnie jestesmy przkierowani na strone show.html wyswietlajaca utworzony artykul 

=end
  else
    render 'new'
  end
end

  def show

  end

  def edit

  end

  def update
    @article=Article.new(article_params)
    @artilce.user = User.first
    if @article.save
    flash[:notice] = "Article was successfully updated"
    redirect_to article_path(@article)
  else
    render 'edit'

  end
  end

private
def set_article
  @article = Article.find(params[:id])
end

  def article_params
=begin
to jest dosc wazny temat z tego co sie dowiedzialem chodzi tu o bezpieczenstwo i to
co moze byc przekazane do paramatrow strony w tym wypadku udostepniamy przekazanie 
:title i :description, nie do konca rozumiem co robi require , zgaduje ze jest poprostu odniesieniem do moedlu article i danych title description
=end
    params.require(:article).permit(:title,:description)
  end

def require_same_user
  if current_user != @article.user and !current_user.admin?
    flash[:danger]= "You can olny delte or edit your own articles ! ! !"
    redirect_to root_path
  end
end
end
