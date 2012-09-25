# This is a temporary hack to get around some hackery with Devise when
# using the authentication macros in request specs that are defined in
# refinerycms-testing. If you remove this line ensure that tests pass
# in an extension that is testing against this Factory via the
# authentication macros in refinerycms-testing.
# 10-11-2011 - Jamie Winsor - jamie@enmasse.com

FactoryGirl.define do
  factory :superuser_role, :class => Refinery::Role do
    title "Superuser"
  end

  factory :refinery_role, :class => Refinery::Role do
    title "Refinery"
  end

end
