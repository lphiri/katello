module Katello
  module Glue::Pulp::PackageGroup
    extend ActiveSupport::Concern
    include LazyAccessor

    included do
      lazy_accessor :pulp_facts, :initializer => :backend_data

      lazy_accessor :optional_package_names, :mandatory_package_names,
                    :conditional_package_names, :default_package_names, :_id,
                    :repository_memberships,
                    :initializer => :pulp_facts
    end
  end
end
