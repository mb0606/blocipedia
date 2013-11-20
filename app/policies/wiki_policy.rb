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
    scope.where(:id => record.id).exists?
  end

  def create?
    user.admin? or not post.published?
  end

  def new?
    create?
  end

  def update?
    user.admin? or not post.published?
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

