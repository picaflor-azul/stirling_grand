SET @configuration_group_id=0;
SELECT (@configuration_group_id:=configuration_group_id) FROM configuration_group WHERE configuration_group_title= 'Layout Settings' LIMIT 1;
INSERT INTO configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES 
(NULL, '<font color="#0044ff">ACTIVATE Responsive Template by selecting Column Widths</font>', 'COLUMN_WIDTH', '3', 'Width of the Left and Right Columns<br />0 = Use Default Template Settings<br />1 = 75px<br />2 = 150px<br />3 = 225px',@configuration_group_id, NULL, NOW(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');

ALTER TABLE layout_boxes ADD show_box_min_width TINYINT( 1 ) NOT NULL DEFAULT '1' AFTER layout_box_status_single;
