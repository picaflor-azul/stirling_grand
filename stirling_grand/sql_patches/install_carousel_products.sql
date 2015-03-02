SELECT @cid:=configuration_group_id
FROM configuration_group
WHERE configuration_group_title= 'Carousel Featured Products';
DELETE FROM configuration WHERE configuration_group_id = @cid;
DELETE FROM configuration_group WHERE configuration_group_id = @cid;
INSERT INTO configuration_group VALUES (NULL, 'Carousel Featured Products', 'Set Carousel Featured Products Options', '1', '1');
SET @cid=last_insert_id();
UPDATE configuration_group SET sort_order = @cid WHERE configuration_group_id = @cid;
INSERT INTO configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES 
(NULL, 'Carousel Featured Products', 'CAROUSEL_FEATURED_PRODUCTS', 'true', 'Display your featured products in a carousel?<br /><br/>Default = true<br/>', @cid, 101, 'zen_cfg_select_option(array(\'true\', \'false\'), ', now()),
(NULL, 'Maximum Display Carousel Featured Products', 'MAX_DISPLAY_SEARCH_RESULTS_CAROUSEL_FEATURED', '10', 'Set this to how many featured products you have - regardless of the number, only three will show on the carousel at a time.<br/><br/>Default = 10<br/>', @cid, 102, NULL, now()),
(NULL, 'Display Description', 'CAROUSEL_FEATURED_DESCRIPTION', 'false', 'Display featured products description?<br/><br/>Default = true<br/>', @cid, 105, 'zen_cfg_select_option(array(\'true\', \'false\'), ', now()),
(NULL, 'Description Length', 'CAROUSEL_FEATURED_DESCRIPTION_LENGTH', '100', '--ONLY APPLICABLE IF DISPLAY DISCRIPTION IS TRUE--<br/><br/>Featured product description length in chatacters<br/><br/>Default = 100<br/>', @cid, 106, NULL, now()),
(NULL, 'Display Button', 'CAROUSEL_FEATURED_LINK', 'true', 'Display "Buy Now" or "More Information" buttons?<br/><br/>Default = true<br/>', @cid, 107, 'zen_cfg_select_option(array(\'true\', \'false\'), ', now()),
(NULL, 'Display Price', 'CAROUSEL_FEATURED_PRICE', 'true', 'Display featured product price?<br/><br/>Default = true<br/>', @cid, 107, 'zen_cfg_select_option(array(\'true\', \'false\'), ', now()),
(NULL, 'Carousel Featured Image Listing Width', 'IMAGE_CAROUSEL_FEATURED_PRODUCTS_LISTING_WIDTH', '200', 'The width of the product images in the carousel.<br/>Default = 100', @cid, 108, NULL, now()),
(NULL, 'Carousel Featured Image Listing Height', 'IMAGE_CAROUSEL_FEATURED_PRODUCTS_LISTING_HEIGHT', '200', 'The height of the product images in the carousel.<br/>Default = 80', @cid, 109, NULL, now());

# Register the configuration page for Admin Access Control
INSERT IGNORE INTO admin_pages (page_key,language_key,main_page,page_params,menu_key,display_on_menu,sort_order) VALUES ('configCarouselFeatured','BOX_CONFIGURATION_CAROUSEL','FILENAME_CONFIGURATION',CONCAT('gID=',@cid),'configuration','Y',@cid);