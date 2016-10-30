
Please run 'ruby run.rb' on your terminal after cloning the file.

I am including secret.rb for the sake of convenience.

Currently the error that I am getting is this:

/Users/eceozalp/.rvm/gems/ruby-2.2.3/gems/podio-2.0.0/lib/podio/middleware/error_response.rb:51:in `on_complete': Invalid value {"status": "active", "text": "Legislative", "id": 7, "color": "DCEBD8"} (object): must be string or must be integer (Podio::BadRequestError)

this aforementioned object is nested inside @modified_item[0], yet it is not the first nested object (which is why I am a bit confused).

According to Podio API documentation Podio::Item.create method takes in two arguments, app_id and {fields: "TO_BE_FILLED" }. I replaced the "TO_BE_FILLED" part with the fetched items after modifying them, assuming that their fields would match the fields to be created after their old ID's are removed. That didn't turn out to be the case... 

note: inside example_item.json I am committing @fetched_item[0] for your convenience. (it is not JSONified but my VSCode wanted to save it as JSON and I let it. It looks quite nicely spaced here, but I noticed that it looks ugly on github. Please let me know how it looks on your own text editor and if it isn't nice I can actually JSONify it. You can also access the item from your terminal with a binding.pry inside run.rb.  

