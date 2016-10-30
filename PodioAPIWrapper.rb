require 'rubygems'
require 'podio'
require 'json'
require 'pry'

require './secret'

class PodioAPIWrapper
    include AppSecrets
    attr_accessor :fetched_items, :modified_items

    def initialize
        Podio.setup(
            :api_key    => SECRETS['api_key'],    
            :api_secret => SECRETS['api_secret']
            )
        Podio.client.authenticate_with_credentials(
            SECRETS['username'], 
            SECRETS['password']
            )
        @fetched_items = []
        @modified_items = []
    end

    def fetch_items_from_app_1 
        @fetched_items = Podio::Item.find_all(SECRETS['app_1_id'])
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

    def post_modified_items_to_app_2
        @modified_items.each do |item|
            Podio::Item.create(SECRETS['app_2_id'], {
                fields: item["fields"]
            })
        end
    end

end

