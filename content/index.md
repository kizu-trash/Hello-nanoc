---
title: "Welcome to Home Page"
feed_message: "This site have been created, wow!"

kind: "article"
created_at: "13.02.2011 22:22"
---

# Hello there!

Don't forget to change site's global variables in config.yaml:

* `base_url` is now `<%= config[:base_url] %>`
* `author_name` is now `<%= config[:author_name] %>`
* `author_uri` is now `<%= config[:author_uri] %>`

Also, here is a <%= link_to("link to a test article","/article/") %> for you!

Than, there is a custom link with some layout rendering: <%b-link, :url => '#ololo'%>Hellololo!<% end %>

Enjoy!