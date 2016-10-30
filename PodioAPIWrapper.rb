require 'podio'
require './secret'

class PodioAPIWrapper
    attr_accessor :fetched_items, :modified_items
    include AppSecrets

    def initialize(key, secret, username, password)
        Podio.setup(
            :api_key    => key,    
            :api_secret => secret
            )
        Podio.client.authenticate_with_credentials(
            username, 
            password
            )
        @fetched_items = []
        @modified_items = []
    end

    def fetch_items_from_app(app_id)
        @fetched_items = Podio::Item.find_all(app_id)
    end

    def select_items_with_confirmed_dates
        @fetched_items["all"].each do |item|
            item["fields"].each do |field|
                if field["label"] == "Scheduling Status"
                    if field["values"][0]["value"]["text"] == "Date confirmed"
                        @modified_items << item  
                    end
                end
            end
        end
    end

    def remove_duplicates
        @modified_items.uniq! do |item|
            item["fields"][4]["values"][0]["start"]
        end
    end

    def delete_old_field_ids
        @modified_items.each do |item|
            item["fields"].each do |field|
                field.delete_if { |key, value| key == "field_id"}
            end
        end
    end

    def post_items_to_app(app_id)
        @modified_items.each do |item|
            Podio::Item.create(app_id, {
                fields: item["fields"]
            })
        end
    end

end

