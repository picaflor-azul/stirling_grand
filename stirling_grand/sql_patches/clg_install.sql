#Column Layout Grid for Product Listing (Add On Module for Zen Cart v1.5.x) 2012-11-17
#Run the following SQL commands into your database. 
#The easiest way is to open Admin->Tools->Install SQL Patches and paste them in the box and click Send.

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  If you are installing this plugin for the first time, or upgrading from an earlier version of this module, run this set of SQL statements:

delete from configuration where configuration_key in ('PRODUCT_LISTING_LAYOUT_STYLE');
delete from configuration where configuration_key in ('PRODUCT_LISTING_COLUMNS_PER_ROW');
delete from configuration where configuration_key in ('PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER');
delete from configuration where configuration_key in ('PRODUCT_LISTING_GRID_SORT');


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, 
       configuration_description, configuration_group_id, sort_order, 
       last_modified, date_added, use_function, set_function) 
       VALUES ('Product Listing - Layout Style', 'PRODUCT_LISTING_LAYOUT_STYLE', 'rows', 
               'Select the layout style:<br />Each product can be listed in its own row (rows option)
                or products can be listed in multiple columns per row (columns option)<br />
				If customer control is enabled this sets the default style.', '8', '41', NULL, 
                now(), NULL, 'zen_cfg_select_option(array(\'rows\', \'columns\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, 
       configuration_description, configuration_group_id, sort_order, 
       last_modified, date_added, use_function, set_function) 
       VALUES ('Product Listing - Columns Per Row', 'PRODUCT_LISTING_COLUMNS_PER_ROW', '3', 
               'Select the number of columns of products to show in each row in the product listing.  
               The default setting is 3.', '8', '42', NULL, now(), NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, 
       configuration_description, configuration_group_id, sort_order, 
       last_modified, date_added, use_function, set_function) 
       VALUES ('Product Listing - Layout Style - Customer Control', 'PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER', '0', 
               'Allow the customer to select the layout style (0=no, 1=yes):', '8', '43', NULL, 
                now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, 
       configuration_description, configuration_group_id, sort_order, 
       last_modified, date_added, use_function, set_function) 
       VALUES ('Product Listing - Show Sorter for Columns Layout', 'PRODUCT_LISTING_GRID_SORT', '0', 
               'Allow the customer to select the item sort order (0=no, 1=yes):', '8', '44', NULL, 
                now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -