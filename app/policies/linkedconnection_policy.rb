class LinkedConnectionPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
        #scope.where(user: current_user)
      end
    end
  end