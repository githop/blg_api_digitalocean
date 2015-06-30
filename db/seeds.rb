# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = User.new(username: 'githop', email: 'tom@githop.com', password: 'githop')
g.save

a0 = Article.create(title: "Hello Internet!", posted_on: Date.new(2015,6,27))
a0.user = g
a0.imgs << Img.create(href: 'http://googledrive.com/host/0B9oZ9Poh4Y5NfnpraTB2UFdLamJHMzFnQkszLVdBWklKbFBKY2lGemN5T3hyRVl0ZHV3UFE/hello-world.gif', title:'hello-internet')
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

a1 = Article.create(title: 'Client Series - Intro', posted_on: Date.new(2015,6,28))
# a1.user = User.create(username: "guestAuthor", email: "guest@example.com", password: "guest")
a1.user = g
a1.imgs << Img.create(href: "http://googledrive.com/host/0B9oZ9Poh4Y5NfmF0SFV4VW95QzBYcklTR1k5UDlNLTFROF9fSXpoMG1OTEpfX1Q0UVdQVzg/legobrick.png", title: 'prior art' )
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

a2 = Article.create(title: "Server - Authorization", posted_on: Date.new(2015,6,29))
a2.user = g
file_path = 'http://googledrive.com/host/0B9oZ9Poh4Y5NfldBelFzenJmekJwc2hqSl9KamM5VTN3bjNqWXBsenVPMnF3aV9iYWlJRUk/'
a2.imgs << Img.create(href: file_path + 'lock.png', title: 'lock.png')
a2.imgs << Img.create(href: file_path + 'fig1.png', title:'AuthController call method')
a2.imgs << Img.create(href: file_path + 'fig2.png', title: 'login_user service')
a2.imgs << Img.create(href: file_path + 'fig3.png', title: 'TokenHandler')
a2.imgs << Img.create(href: file_path + 'fig4.png', title: 'ApplicationController')
a2.imgs << Img.create(href: file_path + 'fig5.png', title: 'ArticlesController')


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

