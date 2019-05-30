class ReviewPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  
    def new?
      true
    end
  
    def create?
      true
    end
  
    def edit?
      false
    end
  
    def update?
      false
    end
  
    def destroy?
      false
    end
    
  end