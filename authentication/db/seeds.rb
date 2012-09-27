#Roles creation

Refinery::Role[:refinery]
Refinery::Role[:superuser]

#Permissions creation
Refinery::Permission.create!(:action => 'manage', 
                             :subject_class => 'Refinery::Page', 
                             :name => 'manage', 
                             :description => 'All Refinery Pages objects operations' )
Refinery::Permission.create!(:action => 'read', 
                             :subject_class => 'Refinery::Page', 
                             :name => 'read', 
                             :description => 'Read Refinery Pages objects' )
Refinery::Permission.create!(:action => 'create', 
                             :subject_class => 'Refinery::Page',
                             :name => 'create',
                             :description => 'Can create Refinery Pages objects' )
Refinery::Permission.create!(:action => 'update', 
                             :subject_class => 'Refinery::Page', 
                             :name => 'update', 
                             :description => 'Can update Refinery Pages objects' )
Refinery::Permission.create!(:action => 'delete', 
                             :subject_class => 'Refinery::Page',
                             :name => 'delete',
                             :description => 'Can delete Refinery Pages objects' )



