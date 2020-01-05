class ApplicationController < ActionController::Base
  # zapobiega atakom CSRF przez wywyolanie wyjatku
  # dla API uzyto by :null_session
protect_from_forgery with: :exception
helper_method:current_user,:logged_in? #metody pomocnicze dostepne beda dla views, ogolnie wszystkie metody w pliku Application_controller sa dostepne dla innych kontrolerow

def current_user
=begin
||= 'if not'  ////  jesli nie ma nic w zmiennej current_usser to znajdz Usera w bazie po :user_id jeśli istnieje takie id_dla usera
=end
  @current_user ||= User.find(session[:user_id]) if
                             session[:user_id]
end

def logged_in?
  !!current_user #!! zwraca true jesli argumet istnieje, sprawdza wartość logiczną
end

def require_user
  if !logged_in? #if not logged_in?
  !!current_user
  flash[:danger]="You must be logged in to perform that action"
  redirect_to root_path
end
end


end
