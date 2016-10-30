require './PodioAPIWrapper'
require './secret'

include AppSecrets

Wrapper = PodioAPIWrapper.new(SECRETS['key'], SECRETS['secret'], SECRETS['username'], SECRETS['password'])
Wrapper.fetch_items_from_app(SECRETS['app_1_id'])
Wrapper.select_items_with_confirmed_dates
Wrapper.remove_duplicates
Wrapper.delete_old_field_ids
Wrapper.post_items_to_app(SECRETS['app_2_id'])
 



