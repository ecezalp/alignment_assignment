require './PodioAPIWrapper'


Wrapper = PodioAPIWrapper.new
Wrapper.fetch_items_from_app_1
Wrapper.select_items_with_confirmed_dates
Wrapper.remove_duplicates
Wrapper.delete_old_field_ids
Wrapper.post_modified_items_to_app_2
 



