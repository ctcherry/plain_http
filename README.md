# plain_http

I always forget the API for Net:HTTP. This library wraps Net::HTTP and doesn't try to do anything too clever on top of that. PlainHTTP has 'get', 'post', 'put', and 'delete' methods. Call any of them with the full URL, followed by a hash of headers. In the case of 'post' and 'put' you can include a 3rd parameter which is the data to send along, it can be a string or a hash.

All of the calls return the built in Net:HTTPResponse objects.

## Examples

### GET

    response = PlainHTTP.get('http://www.google.com')
    puts response.body

### POST with form params

    response = PlainHTTP.post('http://example.com/test.php', {}, {:post_name => 'value'})
    puts response.body

### POST with string body

    response = PlainHTTP.post('http://example.com/test.php', {}, '{"name":"Chris Cherry"}')
    puts response.body
