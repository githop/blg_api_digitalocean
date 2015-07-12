# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#https://docs.google.com/uc?id=ID_HERE&export=download

def img_url(id)
	drive_url = 'https://docs.google.com/uc?'
	query_str = URI.encode_www_form([["id", "#{id}"],["export", "download"]])
	drive_url + query_str
end

g = User.new(username: 'githop', email: 'tom@githop.com', password: 'githop')
g.save

a0 = Article.new(title: "Hello Internet!", posted_on: Date.new(2015,6,27))
a0.user = g
a0.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NeDRCWVdCQjlVYUk'), title:'hello-internet')
a0h1 = Header.create(text: "Welcome to my blog")

a0h1.paragraphs << Paragraph.create(body: "If you know me, you probably know I enjoy a good conversation and can be rather talkative in general. Strangely enough, that doesn’t seem to translate into me blogging very often. Blogging platforms have long been available to those with the urge to blog. So if it were the case that I needed a blogging outlet, you likely wouldn’t be reading this here.")

a0h2 = Header.create(text: 'So what brings us here?')

a0h2.paragraphs << Paragraph.create(body: "Well odds are you likely know me personally. If that is the case, then I likely referred you here. Another case could be that you are a fellow engineer, or perhaps a recruiter here to check out my credentials. If you are an engineer, hopefully you came here from github to see my code live on the web.")

a0h3 = Header.create(text: 'From soup to nuts')

a0h3.paragraphs << Paragraph.create(body: "At the end of the day, this is probably going to mostly be an engineering blog. At the time of writing this post the blog has reached a point where I can display articles. So I’ve begun to curate content. After all, it turns out you need content on a blog.")
a0h3.paragraphs << Paragraph.create(body: "This blog is built from various web technologies mostly from scratch. It’s pretty easy to build a blog with the tools we have available these days. In particular, when this post was authored, I’m using a Rails server to serve an AngularJS app. The Angular app is what you (the client) are currently interfaced with.")
a0h3.paragraphs << Paragraph.create(body: "Currently, the resume section of this blog is all static HTML and JS. This blog content is being served from Rails as JSON (and consumed by Angular). Up the chain, all of this is being served via a digital ocean VM running Ubuntu Server. I use NGINX as a proxy to Unicorn which is the server I have chosen to use in my Rails production environment. Phew!")

a0h4 = Header.create(text: 'Welcome and thanks for stopping by')
a0h4.paragraphs << Paragraph.create(body: "The main purpose of this blog is more or less a personal sandbox. Who knows, perhaps I’ll come around to blogging and post more non-engineering content. That would give me a reason to implement tags, of course ;) .")

[a0h1, a0h2, a0h3, a0h4].each do |header|
	a0.headers << header
end

a0.save

a1 = Article.new(title: 'Client Series - Intro', posted_on: Date.new(2015,6,28))
# a1.user = User.create(username: "guestAuthor", email: "guest@example.com", password: "guest")
a1.user = g
a1.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NUjRpN1hpRS1hVlE'), title: 'prior art' )
a1h0 = Header.create(text: "Getting Inspiration")

a1h0.paragraphs << Paragraph.create(body: "I set out to achieve a couple of things with this blog. Most of those things are centered around achieving little proof-of-concepts regarding technologies which I see as relevant. It’s mostly an outlet for me to be able to experiment on things in a risk free manner. What typically happens is that I will see some cool new pattern or technique via twitter or reddit. Reading programming articles can be pretty pointless unless you take the time to internalize the things you are reading about. One of the best ways to do that is something like this blog.")

a1h1 = Header.create(text: "Angular Concepts")

a1h1.paragraphs << Paragraph.create(body: "Most of the things I set out to achieve on this blog are related to Angular best practices, such as: the component pattern, using a self-documenting file structure / naming scheme, nested views, controllerAs syntax, etc… Due to the nature of code best practices, they aren’t really evident when blogging the site as a typical user would. To get a sense for how I use them, Github is your best option.")

a1h2 = Header.create(text: "General Concepts")

a1h2.paragraphs << Paragraph.create(body: "One potential anti-pattern is learning only domain specific knowledge; for example, only learning concepts that purely apply to Angular. As we all know, Javascript is a wild beast; Angular could fall out of favor as just as fast as it became a preferred option for many. It can result in folks trying to apply what they know in other domains and having a hard time. It is always useful to spend some time developing general knowledge, even if it may be immediately not practical.")
a1h2.paragraphs << Paragraph.create(body: "To that end, some generally good things I’m trying to implement on this blog are client-side data caching, token based authentication using JWTs, role based authorization, to mention a few. I also try to not rely on Angular concepts when writing my Javascript, such as abstaining from using $scope, or wrapping my Angular services with POJOs. At the time of writing this post, I have the client side caching implemented, and have JWT auth setup on the server; stay tuned for more posts on each individual subject.")
a1h2.paragraphs << Paragraph.create(body: "It seems the creators of Angular are also prioritizing this approach, and seem to be making Angular 2 more general in implementation. For example, event based directives like ng-click have been completely removed due to a new clever way to bind to native browser events. They have gotten rid of something like 20+ directives.")
a1h2.paragraphs << Paragraph.create(body: "A lot of folks in the Angular community seem to be upset over surface details (e.g. binding syntax) while not embracing a lot of the improvements made across the board. I certainly won’t be writing Angular 2 in production anytime soon but have been trying to learn basic javascript patterns. I’m sure they will translate.")

a1h3 = Header.create(text: 'Personal Objectives')

a1h3.paragraphs << Paragraph.create(body: "I wanted to architect this blog in in a particular manner, with clear divides between client and server. This can result duplication of effort if you are not careful. I also wanted some flexibility over the layout of blog posts. I want the ability to insert photos where necessary and customize each blog post as I see fit.")
a1h3.paragraphs << Paragraph.create(body: "I realized early on that I couldn’t use a single template for the blog post and simply ng-repeat over my JSON to stamp out blog posts. I ended up using unique templates for each post and created a directive to handle the layout of paragraphs. More on that to come, of course.")
a1h3.paragraphs << Paragraph.create(body: "It should also be somewhat simple to create and edit posts through the blog as well. I have yet to implement client side post create / edit, although I have most of the server side work in place. Currently all the data comes hard coded from the seed file. I have yet to settle over the fine details on how I want to go about implementing the above, but I’m sure you’ll hear about it when I figure it out! Thanks for reading, stay tuned for more.")

[a1h0, a1h1, a1h2, a1h3].each do |header|
	a1.headers << header
end

a1.save

a2 = Article.new(title: "Server - Authorization", posted_on: Date.new(2015,6,29))
a2.user = g

a2.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NQ1piWUtiOFJfQ2M'), title: 'lock.png')
a2.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NQW1qNXR4bjZiMFk'), title:'AuthController call method')
a2.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NVHUzdmlYeDFySGM'), title: 'login_user service')
a2.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5Nc08yc2ZBOWdDdk0'), title: 'TokenHandler')
a2.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NSFJ3b25IRHJmUFk'), title: 'ApplicationController')
a2.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NVjV3VFJNTk5EVFU'), title: 'ArticlesController')


a2h0 = Header.create(text: 'Rails with Token Authentication')
a2h1 = Header.create(text: 'Managing State')
a2h2 = Header.create(text: 'The Implementation')
a2h3 = Header.create(text: 'Flow: Token vs Session ')
a2h4 = Header.create(text: 'Wrap Up')

a2h0.paragraphs << Paragraph.create(body: 'One of the big features I’ve always wanted for this blog are token based authentication. They fit in very well with my app architecture. I try to keep good API design principles in mind when building out my rails back end and token auth encourages good stateless API design.')
a2h0.paragraphs << Paragraph.create(body: 'Token auth is very much like an Epic pass at Breckenridge resorts. You are given a lift ticket (token), with which you can access the mountain (a protected resource), but before you do, you must have your ticket scanned in the lift line (validity of token). Most resorts scan your ticket at the base of each lift (Authorization header on each request).')
a2h0.paragraphs << Paragraph.create(body: 'The analogy goes to the next level when you consider that an Epic pass will get you in the door in any Breckenridge owned ski-resort, much like how a signed token will permit you to access resources behind different servers, which are all owned by the same entity.')
a2h0.paragraphs << Paragraph.create(body: 'An API request should have everything the server needs to respond correctly. In this instance, since the token is provided by the client, the server doesn’t need to rely on session data to complete the request. If the token isn’t provided, the server knows that in advance, as it didn’t receive a token.')

a2h1.paragraphs << Paragraph.create(body: 'It is true that you can store the token in session as a cookie on the client. This approach, in my opinion, diminishes the advantages of using token based auth in the first place. One of the many benefits of token auth is not having to create a session store (on the server) for each user.')
a2h1.paragraphs << Paragraph.create(body: 'We use session store most often to keep relevant info (e.g. user id , or access level) about the user in between requests. We have do it this way because HTTP is a stateless protocol. There is a performance hit for the server maintaining a store for each user that is currently using your app.')
a2h1.paragraphs << Paragraph.create(body: 'This is acceptable because of security concerns, and it is typically the policy to assume that the client cannot be trusted. Session stores beef up security because it is something that is done on the server, the cookie is acting like a key to decrypt your session data on the server.')
a2h1.paragraphs << Paragraph.create(body: 'If you attempt to emulate token based auth by storing the token as session data (a cookie), then you’re missing the point of using tokens in the first place. We don’t need to server to store the relevant user data, as we can trust the payload in the signed token issued by our server.')
a2h1.paragraphs << Paragraph.create(body: 'The token has to be decoded by the server anyway to verify its authenticity. This is a lot easier to do than deserialize session data for each request. Using cookies as tokens means you have to decode the token AND deserialize the session store for each request. And you can no longer scale up your app across multiple servers, as the session store will be different for each server that your app is coming from.')

a2h2.paragraphs << Paragraph.create(body: 'The relevant files are: <code>app/services/authenticate_user.rb, app/services/login_user.rb, app/controllers/auth_controller.rb, lib/token_handler.rb</code>.')
a2h2.paragraphs << Paragraph.create(body: 'The relevant  gems: <code>rack-cors, jwt, simple_command, bcrypt</code>')
a2h2.paragraphs << Paragraph.create(body: 'Rails has some very slick authentication options, one of them being devise. I opted not to use devise on this project as it is very robust and no longer supports token auth to my knowledge. Fortunately Rails has tight integration with a crypto tool called Bcrypt. Bcrypt basically encrypts your password before it is stored in the database so if someone were to compromise your dataset, they would only have access to encrypted usernames and passwords.')
a2h2.paragraphs << Paragraph.create(body: 'If you are using Bcrypt, Rails will add a few nice methods to your user class if you declare this inside of the User class: <code>has_secure_password</code>. Specifically it gives you an :authenticate method to check the username / password of your users.')
a2h2.paragraphs << Paragraph.create(body: '<code>simpe_command</code> allows you to easily create service objects in ruby. I saw it in several tutorials regarding JWTs so I figured I’d give it a try. <code>rack-cors</code> gem is for easily enabling cross-origin-resource-sharing in the rails.')

a2h3.paragraphs << Paragraph.create(body: 'The main difference in a token flow vs a session flor for auth is this: after you have authenticated your user, rather than setting their user_id to session data, you issue them a token with a payload that contains the user_id (and what ever else you deem relevant).')
a2h3.paragraphs << Paragraph.create(body: 'In my <code>AuthController</code> you can see using the User service to sign in my users and issue them a token.')
a2h3.paragraphs << Paragraph.create(body: 'If you’re scanning the above code snippets you’re probably wondering about the <code>TokenHandler</code>. It actually is the meat of the app, in terms of token process. It basically exposes the functionality of the JWT gem by wrapping it in a PORO. Let’s take a look:')
a2h3.paragraphs << Paragraph.create(body: '<code>:encode_auth_token, :decode_auth_token</code> are where most of the magic happens. The token is signed with the Rails application secret. The tutorial I followed used the salted password to sign the tokens for each user. I wonder what the benefits of that approach could be. I chose using the app secret because you can distribute it across rails apps and then each server can independently issue / verify tokens.')
a2h3.paragraphs << Paragraph.create(body: 'According to the JWT standard, you can define a claims object to contain your payload. Currently there is no size limit, but since this is a response header I’d imagine keeping it as small as possible is ideal. There are a couple of required fields that the claims object must have, check out the JWT spec to learn about them.')
a2h3.paragraphs << Paragraph.create(body: 'The claims object isn’t encrypted, although the spec has support for encrypted claims. The cryptographic aspect of JWTs has to do with verifying the authenticity of a token, and to do that the token signature is used.')
a2h3.paragraphs << Paragraph.create(body: 'A important piece of the puzzle is in the <code>ApplicationController</code>. Rails has several hooks into the request lifecycle that serve as callbacks. I defined a <code>:authenticate</code> method in the <code>ApplicationController</code>, which is the parent to all other controllers. This method uses the <code>AuthenticateUser</code> service, which is responsible for checking the validity of a token and appending the token to the response for the client.')
a2h3.paragraphs << Paragraph.create(body: 'To protect a resource, you use the <code>:before_action</code> filter and call the <code>:authenticate</code> method defined in your <code>ApplicationController</code>. Here is me protecting my create method on the articles resource:')
a2h3.paragraphs << Paragraph.create(body: 'in this instance, I’m only protected a single route / method, but you get the picture!')

a2h4.paragraphs << Paragraph.create(body: 'That’s pretty much the life cycle of an authenticated request in my app. Be sure to stick around to see the follow up post on the client side!')

[a2h0, a2h1, a2h2, a2h3, a2h4].each do |header|
	a2.headers << header
end

a2.save

a3 = Article.new(title: 'Client -  Authentication', posted_on: Date.new(2015,6,30))
a3.user = g

a3.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5Nblo5WTg2UGRWX1U'), title: "keys")
a3.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NV1Y4ZWxsOVFaU28'), title: "User login function")
a3.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NYzZ2ZGNMMWZGNjQ'), title: "Remembering the current user")
a3.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NaXBpUm5tZGNYNkU'), title: "AuthToken")
a3.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NWnV0RzZVc0wyQ00'), title: "shell template html")
a3.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NODZoUGN3b0VfOUU'), title: "HomeCtrl")

a3h0 = Header.create(text: "Angular and Json Web Tokens")
a3h1 = Header.create(text: "Token Concerns")
a3h2 = Header.create(text: "Informing the User")
a3h3 = Header.create(text: "Wrap Up")

a3h0.paragraphs << Paragraph.create(body: "In my previous post, I detailed how I setup JWT server side. This post details the implementation in the Angular client. In order to get this done, I used a User service (a factory), an Angular interceptor, and an AuthToken factory. If you are unfamiliar with Angular, factories and basically singletons, and an interceptor is just a factory as well. This code is on github, checkout the auth folder of githop.com repo for the souce files.")
a3h0.paragraphs << Paragraph.create(body: "The basic auth features I expect are the user logging in, persisting their issued token, appending it to the necessary HTTP requests, and the app should notify the user if they are logged in or not. I also want the app to remember if I’m logged in if I leave and return. Here’s how I used the services mentioned earlier to make it happen.")

a3h1.paragraphs << Paragraph.create(body: "The User service handles login and remembering the current user. The JWT payload contains data about the user, but must be decoded first. Once the User service is provided the token, it will decode it and store the payload data in the service. Since I’m storing the user data in a factory, it can be injected anywhere in the app where needed.")
a3h1.paragraphs << Paragraph.create(body: "If the token is set in localStorage when the user returns to the site, the User server will honor it, making the user not have to log in again to get the token.")
a3h1.paragraphs << Paragraph.create(body: "The AuthToken factory is basically a setter / getter for the token with localStorage, simple enough.")
a3h1.paragraphs << Paragraph.create(body: "Angular interceptors allow you to manipulate the request / response headers that $http handles. There are 4 methods available, request / response and error handlers for each. I’m only using the request handler at the moment. I use some logic to only apply the request to the articles resource that are going to mutate the database; i.e., non-idempotent stuff. Also, no sense in authenticate our async template requests.")

a3h2.paragraphs << Paragraph.create(body: "I use a particular setup with ui-router to provide a “layout” page for my templates, it takes advantage of nested views and absolutely named views. I have a single entry point of the app (a ui-view,  in index.html) which leads to a layout template (shell.tmpl.html) where the app is actually rendered.")
a3h2.paragraphs << Paragraph.create(body: "The named views are the nav section and body section. The nav template is always shown, and when you are browsing the blog. In typical nav fashion, all the site navigation links are contained within. The body section is a ui-view where the individual pages of the site are injected. This setup reduces copying code as I don’t have use an ng-include for the nav template or copy into the necessary templates. More importantly, ui-router allows absolute views to have their own controllers which, coupled with controller scope inheritance, can be very useful.")
a3h2.paragraphs << Paragraph.create(body: "Since my entire app is pumped through these 2 named views, the layout template (shell.tmpl.html) provides a globally accessible point for me to provide data other templates throughout the whole app. The layout template is registered to the HomeCtrl, which is where I inject my User service and house my login logic.")
a3h2.paragraphs << Paragraph.create(body: "This makes it so I can access my current user basically anywhere in the app, as the Home state is somewhat of a root state.")

a3h3.paragraphs << Paragraph.create(body: "Right now, I have everything in place to actually take advantage of an authorized user flow, although there is no aspect in my blog that currently uses it. This is because the blog is under heavy development, and at the moment I have yet to settle on exactly how I want to implement the create and edit aspects of the blog process, which you would need to have proper access to do.")
a3h3.paragraphs << Paragraph.create(body: "When I wrote this post, all the blog post data is still being hard coded into the rails seed file, which is fine, as a big purpose of this blog has to do with consuming JSON from a restful resource. My next post will detail how I do client side data modeling. Thanks for reading and stay tuned for updates!")

[a3h0,a3h1,a3h2,a3h3].each do |header|
	a3.headers << header
end

a3.save

a4 = Article.new(title: 'Client - Data Model', posted_on: Date.new(2015,7,07))
a4.user = g

a4.imgs << Img.create(href: img_url("0B9oZ9Poh4Y5Nc1NPZExSUEpxbzQ"), title: "Client - Data Model")
a4.imgs << Img.create(href: img_url("0B9oZ9Poh4Y5NaTVnNzBONU1vaWM"), title: "top level json response")
a4.imgs << Img.create(href: img_url("0B9oZ9Poh4Y5NVzdwRUpjRjEtMlE"), title: "single resource")
a4.imgs << Img.create(href: img_url("0B9oZ9Poh4Y5NWS1HQ2tzcExUdUE"), title: "BlogCtrl")
a4.imgs << Img.create(href: img_url("0B9oZ9Poh4Y5NUVQzelh3WHR1Rzg"), title: "PostCtrl")

a4h0 = Header.create(text: "ActiveModel::Serializers")
a4h1 = Header.create(text: "JSON:API")
a4h2 = Header.create(text: "Flat Json")
a4h3 = Header.create(text: "Benefit")
a4h4 = Header.create(text: "Code and Tell")
a4h5 = Header.create(text: "Posts Service")
a4h6 = Header.create(text: "Order of Operations")
a4h7 = Header.create(text: "Wrap Up")

a4h0.paragraphs << Paragraph.create(body:"On the server side, this blog users rails-api with a gem called ActiveModel::Serializers. AMS is for serialization of ActiveRecord objects. AMS allows for serializers to be defined that give you control over the final json schema. It will also handle relations and embed the necessary hierarchy into the final json object.")
a4h0.paragraphs << Paragraph.create(body:"I first used it in another app of mine, padded pockets, but it has been updated since then. One of the new features available is swappable adapters. The default adapter will more or less resemble the output of calling <code>:to_json</code> on a basic model with no included relations.")

a4h1.paragraphs << Paragraph.create(body: "I mention all of this only because this is where I heard about the JSON:API spec. It is designed to standardize the format of a JSON response. It’s similar to HAL, but is more clever in its design to allow to fancy client side data caching. After reading the spec and seeing who the authors were, I decided to give it a try for this particular app.")
a4h1.paragraphs << Paragraph.create(body: "The spec is at version 1.0 and is considered stable, although AMS does not do a good job adhering to the spec. The spec requires that all responses consist of three things, a links object for navigation, a data array for the primary resource and an included array for any related resources.")
a4h1.paragraphs << Paragraph.create(body: "One thing I noticed is that all resources have uniform format as well. In JSON:API, a resource object has the following attributes: type, id, attributes, and relationships. Attributes and relationships are objects themselves with a uniform format.")

a4h2.paragraphs << Paragraph.create(body: "By default AMS will serialize a simple one-to-many relation by embedding the related objects into an array of objects inside the parent node. At first this is the approach I preferred, as it is the easiest setup to ng-repeat over for an Angular client. Using JSON:API spec, I am still heavily manipulating the response to make it nice to use in my templates.")
a4h2.paragraphs << Paragraph.create(body: "I figure this is because the prime driver behind JSON:API spec is EmberJs. The latest version of EmberData is using the spec by default. There is already one angular module I saw related to JSON:API but I decided to use my own implementation.")
a4h2.paragraphs << Paragraph.create(body: "When you can count on a uniform format of the json response it makes it easier to recreate the same data model on the client. All resources have an id and type attribute, and the data you are after is either in the primary resource or in the <code>included</code> array. Objects in the <code>included</code> array have the same attributes as the primary resource.")

a4h3.paragraphs << Paragraph.create(body: "This means that if you are requesting a collection or single resource from your server you will get the exact same json back every time. The downside is that you have to do a lot of work to handle the data on the client side to rebuild the data model for easy use. Using the JSON:API spec initially took more effort for me, but the it soon became worth the effort.")

a4h4.paragraphs << Paragraph.create(body: "To take advantage JSON:API I used a few custom services: <a href='https://github.com/githop/githop.com/blob/master/src/app/home/blog/blogpost.model.js' target='_blank'>blogpost.model.js</a> and <a href='https://github.com/githop/githop.com/blob/master/src/app/home/blog/posts.srv.js' target='_blank'>posts.srv.js</a>. They are both Angular factories but the naming convention in use shows what they do. The BlogPost model is for storing data for a single post. The Posts service is for getting posts from the server and turning them into BlogPost instances to be cached.")

a4h5.paragraphs << Paragraph.create(body: "The Posts service exposes four methods:<code>  getPool(), getArticle(), loadAll(), setArticle() </code>. After any resource has been requested, it’s cached inside the Posts service for use later. <code>getPool()</code> returns what is in the cache. The rest of the methods are responsible for populating the cache or using the cache to return a resource without requesting it from the server.")
a4h5.paragraphs << Paragraph.create(body: "<code>loadAll()</code> returns a Promise which resolves to an array of BlogPost instances from the server. It will also cache each instance as they come in from the server.")
a4h5.paragraphs << Paragraph.create(body: "<code>getArticle()</code> returns a Promise that resolves to a single post from the cache, or will request and cache it from the server.")

a4h6.paragraphs << Paragraph.create(body: "The way I use these methods with the app architecture allows some slick benefits, such as no http requests after the initial posts load. Since I’m storing data in services rather than controllers, I can inject them into the necessary controller and have access to the methods exposed.")
a4h6.paragraphs << Paragraph.create(body: "When a user clicks on the blog link, the BlogCtrl will fire up and fetch the cache from the Posts serice. The Post service has an init function which gets all posts from the server and caches them.")
a4h6.paragraphs << Paragraph.create(body: "When a user clicks on a blog post, the PostCtrl will fire up and fetch the individual post from the cache. PostCtrl is fed route params from ui-router and uses them to know which post to grab from the cache.")
a4h6.paragraphs << Paragraph.create(body: "If you browse my blog with your network tab open, you’ll notice that after the initial request to the <code>/articles</code> resource on the rails server, no more data requests are made from that point on.")

a4h7.paragraphs << Paragraph.create(body: "There isn’t a clearly defined community solution to modeling data on the client with Angular. I’ve seen a lot of approaches on the blogosphere regarding ways to make it happen. I more or less used a mash up of what I liked from several blog posts, plus the typical custom tweaking to fit my needs.")
a4h7.paragraphs << Paragraph.create(body: "I currently don’t have enough posts to start paginating my requests, but I think the JSON:API will make implementing pagination simple when the time comes. Thanks for stopping by, stay tuned for updates!")

[a4h0, a4h1, a4h2, a4h3, a4h4, a4h5, a4h6, a4h7].each do |header|
	a4.headers << header
end

a4.save

a5 = Article.new(title: "Sentiment Analysis", posted_on: Date.new(2015,7,11))
a5.user = g
a5.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NRVUtekU5SjQtWDQ'), title: 'happy neutral sad faces')
a5.imgs << Img.create(href: img_url('0B9oZ9Poh4Y5NWUdUR2JrelJSSGM'), title: 'my ruby command line app')
a5.imgs <<  Img.create(href: img_url('0B9oZ9Poh4Y5NT2ljWVpQbldrbEE'), title: 'dictionary snippet')

a5h0 = Header.create(text: "Challenge Accepted")
a5h1 = Header.create(text: "Simple Solution")
a5h2 = Header.create(text: "Algorithm")
a5h3 = Header.create(text: "Implementation")
a5h4 = Header.create(text: "Wrap Up")

a5h0.paragraphs << Paragraph.create(body: "In a recent job application I encountered one of the more interesting screening techniques used by companies. They gave me a take home challenge to code. The challenge was to write a simple command line program that would search twitter by a given keyword for tweets, and then derive the overall sentiment of each tweet.")
a5h0.paragraphs << Paragraph.create(body: "After some time, I decided to revisit my solution and implement the core algorithm into my blog. You can even give it a try yourself at the top of this post! I’ve since analyzed all the posts in my blog and incorporated the results at the beginning of each post. The rest of this post is about my text sentiment algorithm.")

a5h1.paragraphs << Paragraph.create(body: "Sentiment analysis is pretty fancy sounding, but the solution (in this case) was actually very simple. If you have a list of words with their sentiments, the challenge at this point is basically a lookup problem. Fortunately I was provided a 6k list of words and sentiments in CSV format.")
a5h1.paragraphs << Paragraph.create(body: "The CSV dictionary is pretty much the only thing I used from the original challenge for my blog implementation.")
a5h1.paragraphs << Paragraph.create(body: "In this context, a word can potentially be one of three sentiments: positive, negative, or neutral. The sentiment of a body of text is based upon the sentiments of each word which it is composed of. Here’s basically how my algorithm works:")

a5h2.paragraphs << Paragraph.create(body: "<ol><li>Search dictionary for each word of input text</li><li>derive sentiments of search results</li><li>tally overall sentiment from individual sentiments</li></ol>")

a5h3.paragraphs << Paragraph.create(body: "To make the above happen in my rails app I used a custom class called <a href='https://github.com/githop/blg_api_digitalocean/blob/master/lib/dictionary_handler.rb' target='_blank'>DictionaryHandler</a>. It houses all the sentiment analysis logic. Provide it with a dictionary and string of words and it will handle analyzing the sentiment of those words.")
a5h3.paragraphs << Paragraph.create(body: "It accepts a hash on initialization, which is provided from parsing the CSV dictionary I mentioned earlier. I’m pretty certain that my rails app will parse the CSV when it initializes, and from that point on, the dictionary is stored in memory. I’m not sure if this is poor form, but I’m using a global variable to expose a single instance of the DictionaryHandler for use throughout the app.")
a5h3.paragraphs << Paragraph.create(body: "After I used the DictionaryHandler on my own blog posts, I figured I had to make an interactive blog post where the user could submit their own arbitrary text for analysis, and that is what you see at the top of this post.")

a5h4.paragraphs << Paragraph.create(body: "As always, you can check out the code for this blog on github, enjoy! I hope you are enjoying this post as much as I did making it!")

[a5h0, a5h1, a5h2, a5h3, a5h4].each do |h|
	a5.headers << h
end

a5.save

Article.all.each do |article|
	article.analyze_article
	article.save
end



