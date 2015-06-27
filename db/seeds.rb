# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a0 = Article.create(title: "initial post!")
h1 = Header.create(text: "Begin rant")
a0.headers << h1
h1.paragraphs << Paragraph.create(body: "This is the first paragraph it is kinda short, but deal with it. Shouldn't we have more than two sentences?")
h1.paragraphs << Paragraph.create(body: "Another paragraph to pass the time, should be about a min deep")
h1.paragraphs << Paragraph.create(body: "this should reward you previous efforts. keep up and oyu may just get an image.");

a0.imgs << Img.create(href:'http://i.imgur.com/PrLIbAX.gif', title: 'hello world');

h2 = Header.create(text:"Expand Rant")

a0.headers << h2

h2.paragraphs << Paragraph.create(body: "This is starting to become a thing. I can't imagine what this will serailzie to")
h2.paragraphs << Paragraph.create(body: "We all love json you me, everyone loves json. Cant' wait to consume this as json")
h2.paragraphs << Paragraph.create(body: "Final paragraph for all yall plebs in da house.")

a0.save

a1 = Article.create(title:"second post!")
a1h1 = Header.create(text: "This is another post ya'll");
a1.imgs << Img.create(href:'http://i.imgur.com/e8Lnnol.jpg', title: 'prior art' );

a1.headers << a1h1

a1h1.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h1.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h1.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)

a1.imgs << Img.create(href:'http://i.imgur.com/XDmjfUe', title: 'Shooter McGavern');

a1h2 = Header.create(text: "The latin continues")
a1.headers << a1h2

a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)
a1h2.paragraphs << Paragraph.create(body: Faker::Lorem.paragraph)

a1.save

