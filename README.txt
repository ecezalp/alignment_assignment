
Please run 'ruby run.rb' on your terminal after cloning the file.

I am including secret.rb for the sake of convenience.

Currently the error that I am getting is this:

/Users/eceozalp/.rvm/gems/ruby-2.2.3/gems/podio-2.0.0/lib/podio/middleware/error_response.rb:51:in `on_complete': Invalid value {"status": "active", "text": "Legislative", "id": 7, "color": "DCEBD8"} (object): must be string or must be integer (Podio::BadRequestError)

this aforementioned object is nested inside @modified_item[0], yet it is not the first nested object (which is why I am a bit confused).

note: inside example_item.json I am committing @fetched_item[0] for your convenience. (it is not JSONified but my VSCode wanted to save it as JSON and I let it. It looks quite nicely spaced. 