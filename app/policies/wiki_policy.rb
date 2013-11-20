class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  

  def index?
    false
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def scope
    Pundit.policy_scope!(user, wiki.class)
  end
end

