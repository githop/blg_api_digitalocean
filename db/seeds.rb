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
a1.user = User.create(username: "guestAuthor", email: "guest@example.com", password: "guest")
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

