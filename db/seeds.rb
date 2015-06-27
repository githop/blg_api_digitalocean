# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = User.create(username: 'githop', email: 'tom@githop.com', password: 'githop')

a0 = Article.create(title: "Hello Internet!")
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
a0.user = g
a0.save

a1 = Article.create(title:"second post!")
a1h1 = Header.create(text: "This is another post ya'll");
a1.imgs << Img.create(href:'http://i.imgur.com/e8Lnnol.jpg', title: 'prior art' );

a1.headers << a1h1

a1h1.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h1.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h1.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)

a1.imgs << Img.create(href:'http://i.imgur.com/XDmjfUe.jpg', title: 'Shooter McGavern');

a1h2 = Header.create(text: "The latin continues")
a1.headers << a1h2

a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)

a1.save

