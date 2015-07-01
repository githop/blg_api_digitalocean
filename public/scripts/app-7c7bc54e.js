/**
 *
 * Created by githop on 5/30/15.
 */
!function(){"use strict";angular.module("home",["githopwww"]).config(["$stateProvider",function(t){t.state("home.main",{url:"/",templateUrl:"app/home/home.tmpl.html"}).state("home.resume",{url:"/resume",templateUrl:"app/home/resume/resume.tmpl.html",controller:"ResumeCtrl as Res"}).state("home.blog",{url:"/blog",templateUrl:"app/home/blog/blog.tmpl.html",controller:"BlogCtrl as Blog"}).state("home.blog.post",{url:"/posts/{postId}",views:{"body@home":{templateUrl:function(t){return"app/home/blog/post/post"+t.postId+".tmpl.html"},controller:"PostCtrl as Post"}}})}])}(),function(){"use strict";function t(t,e){var o=this;e.getArticle(t.postId).then(function(t){o.post=t})}angular.module("home").controller("PostCtrl",t),t.$inject=["$stateParams","Posts"]}(),function(){"use strict";function t(){return{restrict:"EA",templateUrl:"app/home/resume/tooltip.tmpl.html",require:"ngModel",scope:{model:"=ngModel"}}}angular.module("home").directive("tooltip",t)}(),function(){"use strict";function t(){var t=this;t.toc=[{id:"#intro",icon:"face",text:"About"},{id:"#exp",icon:"work",text:"Experience"},{id:"#projects",icon:"code",text:"Projects"},{id:"#talks",icon:"group",text:"Talks"},{id:"#competition",icon:"equalizer",text:"Competition"},{id:"#other",icon:"build",text:"Other"},{id:"#edu",icon:"school",text:"Education"}],t.contactInfo=[{link:"mailto:tom@githop.com",icon:"email",text:"tom@githop.com"},{link:"#",icon:"language",text:"githop.com"},{link:"tel:+1-513-675-4467",icon:"contact_phone",text:"(513) 675 - 4467"},{link:"https://github.com/githop",text:"github",immaterial:!0}],t.skills={langs:["JAVASCRIPT","RUBY","PHP","ANGULARjs","NODE","GULP/GRUNT","HTML","CSS"],other:["GIT","LINUX","SQL","TDD","PROTRACTOR","VIM","AUTOMATION"],learning:["DART","ASYNC / AWAIT","WEBSOCKETS"]};var e=[{name:"Javascript",value:2},{name:"Ruby",value:1},{name:"PHP",value:.5},{name:"ANGULRjs",value:1,text:"superheroic MVC framework!"},{name:"NODE",value:1,text:"JS with streams!"},{name:"GULP/GRUNT",value:1,text:"client side build automation"},{name:"HTML",value:3,text:"HTML5 rocks!"},{name:"CSS",value:3,text:"can fizzBuzz in css"},{name:"GIT",value:2,text:"Thanks Linus!"},{name:"LINUX",value:4,text:"Ubuntu user since college"},{name:"SQL",value:3,text:"Bobby Tables will teach you to sanitize your db inputs!"},{name:"TDD",value:1,text:"Rspec, Karma/Jasmine"},{name:"PROTRACTOR",value:1,text:"Integration testing"},{name:"VIM",value:2,text:"no mouse!"},{name:"AUTOMATION",value:2,text:"TravisCI, Teamcity,"},{name:"DART",value:.5,text:"Learning"},{name:"AWS",value:.5,text:"Elastic Beanstalk, S3"},{name:"WEBSOCKETS",value:.5,text:"Learning"}];t.wins=[{text:"Contribute to day to day development on agile team."},{text:"Designed, developed, implemented  gulp based build and optimization process for angular app."},{text:"Established use of AngularJS best practices in client apps (Controller As syntax, Module pattern, nested views with ui-router..etc)."},{text:"Implemented automated build process in TeamCity"},{text:"Developed protractor testing plan for angular client apps."},{text:"Led team discussion and adoption of internal style guide."}],t.skillsChart=e,t.selectedModel={},t.openToolTip=function(e){console.log("find that pop up"),t.selectedModel=e},t.closeToolTip=function(){t.selectedModel={}}}angular.module("home").controller("ResumeCtrl",t),t.$inject=[]}(),function(){"use strict";function t(t,e,o,a){function s(){return d}function r(t){var o=e.defer(),a=c(t);return a?o.resolve(a):m(t,o),o.promise}function i(){var o=e.defer();return t.get(a+"/articles").success(function(t){var e=[],a=_.filter(t.data,function(t){return"articles"===t.type}),s=_.filter(t.included,function(t){return"imgs"===t.type}),r=_.filter(t.included,function(t){return"paragraphs"===t.type}),i=_.filter(t.included,function(t){return"headers"===t.type}),n=_.filter(t.included,function(t){return"users"===t.type});_.each(a,function(t){var o=t.attributes.title,a=t.attributes.posted_on,l=_.filter(n,function(e){return e.id===t.relationships.user.data.id}),d=_.filter(i,function(e){return e.relationships.article.data.id===t.id}),c=_.filter(s,function(e){return e.relationships.article.data.id===t.id});_.each(d,function(t){var e=_.filter(r,function(e){return e.relationships.header.data.id===t.id});t.paragraphs=e});var m={id:t.id,title:o,author:l,datePosted:a,headers:d,imgs:c},u=p(m.id,m);e.push(u)}),o.resolve(e)}).error(function(){o.reject()}),o.promise}function n(){var t=c(articleData.id);return t?t.setData(articleData):t=p(articleData),t}var l={},d=[];l.getPool=s,l.getArticle=r,l.loadAll=i,l.setArticle=n;var c=function(t){return _.find(d,{id:t})},p=function(t,e,a){var s=c(t);return s?s:(s=a?new o(e,a):new o(e),d.push(s),s)},m=function(e,o){t.get(a+"/articles/"+e).success(function(t){var e=p(t.data.id,t,!0);o.resolve(e)}).error(function(){o.reject()})},u=function(){0==d.length&&l.loadAll()};return u(),l}angular.module("home").factory("Posts",t),t.$inject=["$http","$q","BlogPost","API_URL"]}(),function(){"use strict";function t(){var t=function(t,e){e?this.setData(t,e):this.setData(t)};return t.prototype.setData=function(t,e){if(!e)return void angular.extend(this,t);var o=t.data.attributes.title,a=t.data.attributes.posted_on,s=_.filter(t.included,function(t){return"users"===t.type}),r=_.filter(t.included,function(t){return"imgs"===t.type}),i=_.filter(t.included,function(t){return"paragraphs"===t.type}),n=_.filter(t.included,function(t){return"headers"===t.type});_.each(n,function(t){var e=_.filter(i,function(e){return e.relationships.header.data.id===t.id});t.paragraphs=e});var l={id:t.data.id,title:o,author:s,datePosted:a,headers:n,imgs:r};angular.extend(this,l)},t}angular.module("home").factory("BlogPost",t)}(),function(){"use strict";function t(t,e){function o(e){t.go("home.blog.post",{postId:e})}var a=this;a.posts=e.getPool(),a.goToPost=o}angular.module("home").controller("BlogCtrl",t),t.$inject=["$state","Posts"]}(),angular.module("githopwww",["ngAnimate","ngCookies","ngTouch","ngSanitize","ui.router","ngMaterial","home","duScroll","ngDonut"]).value("duScrollOffset",70).constant("API_URL","http://githop.com").config(["$stateProvider","$urlRouterProvider","$httpProvider",function(t,e,o){o.interceptors.push("AuthInterceptor"),t.state("home",{"abstract":!0,views:{"@":{templateUrl:"app/home/layout/shell.tmpl.html",controller:"HomeCtrl as Home"},"nav@home":{templateUrl:"app/home/layout/nav.tmpl.html"},"body@home":{templateUrl:"app/home/layout/body.tmpl.html"}}}),e.otherwise("/")}]),function(){function t(t,e,o,a,s){function r(s,r){var i=a.defer();return o.post(e+"/auth/login",{data:{email:s,password:r}}).then(function(e){t.setToken(e.data.token);var o=p(e.data.token);i.resolve(o)},function(t){i.reject(t)}),i.promise}function i(){return t.setToken(),d=void 0}function n(){return d}var l={},d=void 0;l.login=r,l.logout=i,l.currentUser=n;var c=function(t){var e=t.split(".")[1],o=e.replace("-","+").replace("_","/");return JSON.parse(s.atob(o))},p=function(t){return d=c(t)},m=function(){return s.localStorage["auth-token"]?p(s.localStorage.getItem("auth-token")):void 0};return m(),l}angular.module("githopwww").factory("User",t),t.$inject=["AuthToken","API_URL","$http","$q","$window"]}(),function(){function t(t,e){function o(o){var a=t.getToken(),s=".html"==o.url.substr(o.url.length-5),r=e+"/articles",i=o.url.indexOf(r)>-1,n=("GET"===o.method,"POST"===o.method),l="PUT"===o.method,d="DELETE"===o.method,c="PATCH"===o.method;return i&&!s&&(n||d||l||c)&&(console.log("gonna need that token!"),a&&(o.headers=o.headers||{},o.headers.Authorization="Bearer "+a)),o}return{request:o}}angular.module("githopwww").factory("AuthInterceptor",t),t.$inject=["AuthToken","API_URL"]}(),function(){function t(t){var e="auth-token",o=t.localStorage,a={};return a.setToken=function(t){t?o.setItem(e,t):o.removeItem(e)},a.getToken=function(){return o.getItem(e)},a}angular.module("githopwww").factory("AuthToken",t),t.$inject=["$window"]}(),function(){"use strict";function t(t,e){function o(o){function a(t){var e=this;e.test="hello world",e.login=function(e,o){t.hide({email:e,password:o})},e.close=function(){t.hide()}}t.show({controller:a,controllerAs:"dialog",templateUrl:"dialog1.tmpl.html",parent:angular.element(document.body),targetEv:o}).then(function(t){e.login(t.email,t.password).then(function(t){s.currentUser=t})}),a.$inject=["$mdDialog"]}function a(){s.currentUser=e.logout()}var s=this;s.loginModal=o,s.logOut=a,s.currentUser=e.currentUser()}angular.module("home").controller("HomeCtrl",t),t.$inject=["$mdDialog","User"]}(),function(){"use strict";function t(t,e,o){return{restrict:"A",link:function(a,s){function r(t){var e=t?this.scrollY:l;n=Math.min(i/d,Math.max(0,n+e-l));var a=n*d;a>64&&(a=64),s.css(o.CSS.TRANSFORM,"translate3d(0,"+-a+"px,0)"),l=e}var i,n=(angular.element("#my-nav"),angular.element("#res-col"),0),l=0,d=.5;i=s.prop("offsetHeight"),console.log("toolbar height",i);var c=e.throttle(r);angular.element(t).on("scroll",c)}}}angular.module("githopwww").directive("scrollNav",t),t.$inject=["$window","$$rAF","$mdConstant"]}(),function(){"use strict";function t(){return{restrict:"A",template:['<div ng-repeat="para in header.paragraphs.slice(start -1, end)">','<p ng-bind-html="para.attributes.body"></p>',"</div>"].join(""),scope:{header:"=",start:"@",end:"@"}}}angular.module("githopwww").directive("myPara",t)}(),angular.module("githopwww").run(["$templateCache",function(t){t.put("app/home/home.tmpl.html",'<md-card class="splash-card"><h1>githop</h1><p class="lead"><img ng-src="assets/images/profpic.jpg" class="md-avatar"><br></p><h4>Tom Hopkins</h4>Software Engineer - Full Stack<p></p></md-card><footer layout="row"><md-toolbar><span flex="" offset="66"></span></md-toolbar></footer>'),t.put("app/home/blog/blog.tmpl.html",'<div id="blog-page" layout="column" layout-padding="" layout-margin=""><md-content><div ng-repeat="post in Blog.posts | orderBy:\'-datePosted\' track by post.id" ng-click="Blog.goToPost(post.id)"><md-card class="blog-card clickable"><div class="header-bg"><img ng-src="{{post.imgs[0].attributes.href}}"></div><md-card-content><div layout="row" layout-sm="column" layout-align="space-between center"><h2>{{post.title}}</h2><p>{{post.datePosted | date}} by: {{post.author[0].attributes.username}}</p></div><h4>{{post.headers[0].attributes.text}}</h4><p>{{post.headers[0].paragraphs[0].attributes.body.slice(0,140)}}...</p></md-card-content></md-card></div></md-content></div>'),t.put("app/home/layout/body.tmpl.html",'<div ui-view="" id="body"></div>'),t.put("app/home/layout/nav.tmpl.html",'<span flex=""></span><div class="md-toolbar-tools md-toolbar-tools-bottom btn-small"><h4><span ui-sref="home.main">githop</span></h4></div><div layout="row"><md-button ui-sref="home.resume">resume</md-button><md-button ui-sref="home.blog">blog</md-button><span flex=""></span><md-button ng-show="!Home.currentUser" ng-click="Home.loginModal()">Login</md-button><md-button ng-show="Home.currentUser" ng-click="Home.logOut()">Logout</md-button></div><script type="text/ng-template" id="dialog1.tmpl.html"><md-dialog> <md-toolbar> <div class="md-toolbar-tools"> <h4>Login</h4> </div> </md-toolbar> <md-dialog-content> <p>Login to create / edit Posts (and perhaps more someday!)</p> <div class="login"> <div class="md-actions" layout="column"> <md-input-container> <label>Email</label> <input type="email" ng-model="email"> </md-input-container> <md-input-container> <label>password</label> <input type="password" ng-model="password"> </md-input-container> <md-button ng-click="dialog.login(email, password)">login</md-button> </div> </div> </md-dialog-content> </md-dialog></script>'),t.put("app/home/layout/shell.tmpl.html",'<div layout="column"><md-toolbar id="my-nav" class="md-tall" ui-view="nav" scroll-nav=""></md-toolbar><md-button class="md-fab md-fab-bottom-right" ng-if="Home.currentUser">x</md-button><md-content ui-view="body" layout="column"></md-content></div>'),t.put("app/home/resume/resume.tmpl.html",'<div id="resume" layout="row" layout-sm="column"><div flex=""><md-card class="scrollspy"><md-toolbar><div class="md-toolbar-tools md-toolbar-tools-bottom"><h4>Table of Contents</h4></div></md-toolbar><md-card-content><md-list class="toc"><md-list-item ng-repeat="c in Res.toc" du-scrollspy="" du-smooth-scroll=""><i class="material-icons">{{c.icon}}</i><div class="md-list-item-text"><md-button href="{{c.id}}" du-scrollspy="" du-smooth-scroll="">{{c.text}}</md-button></div></md-list-item></md-list></md-card-content></md-card></div><div id="res-col" flex="75" flex-sm="100"><div layout-padding=""><md-card id="intro"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><img ng-src="./assets/images/profpic.jpg" class="md-avatar res"><h3>G. Tom Hopkins</h3></div></md-toolbar><md-card-content><div layout="row" layout-align="space-between"><div layout="row" layout-sm="column" layout-align="center center" ng-repeat="c in Res.contactInfo" class="contact-info"><a ng-href="{{c.link}}" alt="{{c.text}}" target="_blank"><i ng-class="{\'fa fa-github\': c.immaterial, \'material-icons md-36\': !c.immaterial }">{{c.icon}}</i></a><md-button hide-sm="" ng-href="{{c.link}}" alt="{{c.text}}" target="_blank">{{c.text}}</md-button></div></div><div layout="row" layout-sm="column"><div flex=""><div class="pie-wrapper"><tooltip ng-model="Res.selectedModel"></tooltip><img ng-src="./assets/images/profpic.jpg" class="md-avatar pie"><donut ng-model="Res.skillsChart" width="200" height="200" radius="50" property="\'value\'" mousemove="Res.openToolTip(model)" mouseleave="Res.closeToolTip()"></donut></div></div><div flex=""><p>Technology professional seeking web development positions. Highly motivated, self-directed, autodidactic and passionate. An adept communicator who interfaces well with a diverse set of personality types. Possesses a unique blend of interpersonal and analytical skills and will apply them to the benefit of your organization.</p></div></div></md-card-content></md-card><md-card id="exp"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><i class="material-icons md-36">work</i><h3>Professional Experience</h3></div></md-toolbar><md-card-content><section><div layout="row" layout-align="space-between center"><h4>Trainheroic</h4><div>December 2014 - June 2015</div></div><p>TrainHeroic is a startup specializing in fitness and coach/gym driven workout programs located in Boulder, CO. Product portfolio consists of three web apps, (coach/athlete portal and marketplace) and an iPhone app. Server stack consists of of a monolith PHP app being replaced by a Laravel API. Coach portal and marketplace client apps are AngularJS, athlete portal is currently being rewritten in Angular.</p><md-list><md-list-item class="md-1-line" ng-repeat="win in Res.wins"><i class="material-icons">done</i><br><div class="md-list-item-text" flex="">{{win.text}}</div></md-list-item></md-list></section><md-divider></md-divider><section><div layout="row" layout-align="space-between center"><h4>Independent Ruby Contractor</h4><div>August 2014 - December 2015</div></div><p>Worked on contract basis developing custom software for small businesses in the Boulder area</p></section></md-card-content></md-card><md-card id="projects"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><i class="material-icons md-36">code</i><h3>Projects</h3></div></md-toolbar><md-card-content><section><div layout="row" layout-align="space-between center"><h4><a ng-href="http://devbootcamp.com">Dev Bootcamp</a></h4><div>April - July 2014</div></div><p>Dev Bootcamp is an intensive 9 week program designed to instill a foundation for a career in web development. DBC emphasises non-technical skills such as team integration and engineering empathy.</p><md-divider></md-divider><h4><a ng-href="https://floating-springs-6532.herokuapp.com/#/">PaddedPockets</a></h4><p>Begun as personal project after 6 weeks of Dev Bootcamp. Originally a <a ng-href="https://hidden-shore-1353.herokuapp.com/">Sinatra app</a>, it has since gone through several iterations; <a ng-href="">a Rails app</a>, then 2 AngularJS / Rails hybrid apps. <a ng-href="https://pocketspadded.herokuapp.com/#/">Angular v1</a>, <a ng-href="https://floating-springs-6532.herokuapp.com/#/">v2</a></p><p>In all versions the app pulls data from a 3rd party API, caches it, then returns the data to the user. The Angular/Rails versions use Rails to gather and serialize the data as JSON, which is consumed by the Angular client. All politician images are hosted on Google drive and fetched via API call from the Angular client.</p><h4><a ng-href="https://github.com/dyoachim/soundscript">SoundScript</a></h4><p>Final group project at DBC. SoundScript is a tool for learning new languages via YouTube. Users can watch crowd sourced translations or upload translations of their own. Tools used were primarily JavaScript, the YouTube API, and a Rails server tying everything together.</p></section></md-card-content></md-card><md-card id="talks"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><i class="material-icons md-36">group</i><h3>Community / Talks</h3></div></md-toolbar><md-card-content><div layout="row" layout-align="space-between center"><h4>Boulder Ruby Group - Ruby Newby Beginner’s Track</h4><div>September 2014</div></div><p>Authored presentation at meetup group on basic ruby data structures; i.e. strings and numbers. The series is tailored towards beginners. <a ng-href="http://rubybeginnerstrack.github.io/2014/10/15/basic-data-types.html">Blog Post</a> - <a ng-href="http://githop.github.io/slides_ruby_newby/">Slides</a></p><md-divider></md-divider><div layout="row" layout-align="space-between center"><h4><a ng-href="http://www.meetup.com/RockyMountainAngularJS/photos/25863001/433553204/" target="_blank">Boulder AngularJS Meetup</a></h4><div>January 2015</div></div><p>Delivered talk on experiences using AngularJS with a Rails API. Presentation focused on PaddedPockets Rails and Angular architecture, 3rd party services, development and design decisions along the way, followed by a Q&A session regarding the app.</p></md-card-content></md-card><md-card id="competition"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><i class="material-icons md-36">equalizer</i><h3>Startup Competitions</h3></div></md-toolbar><md-card-content><div layout="row" layout-align="space-between center"><h4>3rd Pace - 2014 Marijuana Tech Startup competition</h4><div>2014</div></div><a ng-href="http://www.cannabrokersnetwork.com/">cannabrokersnetwork.com</a> - code on github<p>2 day hackathon style startup competition. Cannabrokers is a B2B online market for the cannabis industry. Built app on freelance basis and is still under development. Featured in BBC, Yahoo Finance</p></md-card-content></md-card><md-card id="other"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><i class="material-icons md-36">build</i><h3>Other</h3></div></md-toolbar><md-card-content><div layout="row" layout-align="space-between center"><h4>Partner Professional Solutions</h4><div>2009 - 2014</div></div><p>Partner Professional Solutions is predominantly a Healthcare IT recruiting company based in Cincinnati, OH. Roles over tenure included: intern, sales-researcher, IT support, Head of IT. Responsibilities included vendor relations, policy formation/implementation, admin / technical roles.</p></md-card-content></md-card><md-card id="edu"><md-toolbar class="md-warn"><div class="md-toolbar-tools md-toolbar-tools-bottom"><i class="material-icons md-36">school</i><h3>Education</h3></div></md-toolbar><md-card-content><div layout="row" layout-align="space-between center"><h4>Ohio University</h4><div>2012</div></div>Bachelor of Arts Philosophy</md-card-content></md-card></div></div></div>'),t.put("app/home/resume/tooltip.tmpl.html",'<div class="tooltip" ng-show="model.pointer">{{model.name}}: <strong>{{model.value}} Years</strong><br>{{model.text}}</div>'),t.put("app/home/blog/post/post1.tmpl.html",'<div id="blog-page" layout="column" layout-padding="" layout-margin=""><md-content><md-card class="blog-card"><img ng-src="{{Post.post.imgs[0].attributes.href}}" alt="{{Post.post.imgs[0].attributes.title}}"><md-card-content><h1>{{Post.post.title}}</h1><p>Posted on: {{Post.post.datePosted | date}}, By:{{Post.post.author[0].attributes.username}}</p><h3>{{Post.post.headers[0].attributes.text}}</h3><p my-para="" header="Post.post.headers[0]" start="1" end="1"></p><h3>{{Post.post.headers[1].attributes.text}}</h3><p my-para="" header="Post.post.headers[1]" start="1" end="1"></p><h3>{{Post.post.headers[2].attributes.text}}</h3><p my-para="" header="Post.post.headers[2]" start="1" end="3"></p><h3>{{Post.post.headers[3].attributes.text}}</h3><p my-para="" header="Post.post.headers[3]" start="1" end="1"></p></md-card-content></md-card></md-content></div>'),t.put("app/home/blog/post/post2.tmpl.html",'<div id="blog-page" layout="column" layout-padding="" layout-margin=""><md-content><md-card class="blog-card"><img ng-src="{{Post.post.imgs[0].attributes.href}}" alt="{{Post.post.imgs[0].attributes.title}}"><md-card-content><h1>{{Post.post.title}}</h1><p>Posted on: {{Post.post.datePosted | date}}, By:{{Post.post.author[0].attributes.username}}</p><h3>{{Post.post.headers[0].attributes.text}}</h3><p my-para="" header="Post.post.headers[0]" start="1" end="1"></p><h3>{{Post.post.headers[1].attributes.text}}</h3><p my-para="" header="Post.post.headers[1]" start="1" end="1"></p><h3>{{Post.post.headers[2].attributes.text}}</h3><p my-para="" header="Post.post.headers[2]" start="1" end="4"></p><h3>{{Post.post.headers[3].attributes.text}}</h3><p my-para="" header="Post.post.headers[3]" start="1" end="3"></p></md-card-content></md-card></md-content></div>'),t.put("app/home/blog/post/post3.tmpl.html",'<div id="blog-page" layout="column" layout-padding="" layout-margin=""><md-content><md-card class="blog-card"><img ng-src="{{Post.post.imgs[0].attributes.href}}" alt="{{Post.post.imgs[0].attributes.title}}"><md-card-content><h1>{{Post.post.title}}</h1><p>Posted on: {{Post.post.datePosted | date}}, By:{{Post.post.author[0].attributes.username}}</p><h3>{{Post.post.headers[0].attributes.text}}</h3><p my-para="" header="Post.post.headers[0]" start="1" end="4"></p><h3>{{Post.post.headers[1].attributes.text}}</h3><p my-para="" header="Post.post.headers[1]" start="1" end="5"></p><h3>{{Post.post.headers[2].attributes.text}}</h3><p my-para="" header="Post.post.headers[2]" start="1" end="5"></p><h3>{{Post.post.headers[3].attributes.text}}</h3><p my-para="" header="Post.post.headers[3]" start="1" end="2"></p><div class="post-img"><p><code>auth_controller.rb</code></p><img class="" ng-src="{{Post.post.imgs[1].attributes.href}}" alt="{{Post.post.imgs[1].attributes.title}}"><p><code>login_user.rb</code></p><img class="" ng-src="{{Post.post.imgs[2].attributes.href}}" alt="{{Post.post.imgs[2].attributes.title}}"></div><p my-para="" header="Post.post.headers[3]" start="3" end="3"></p><div class="post-img"><img class="post-img" ng-src="{{Post.post.imgs[3].attributes.href}}" alt="{{Post.post.imgs[3].attributes.title}}"></div><p my-para="" header="Post.post.headers[3]" start="4" end="7"></p><div class="post-img"><img class="post-img" ng-src="{{Post.post.imgs[4].attributes.href}}" alt="{{Post.post.imgs[4].attributes.title}}"></div><p my-para="" header="Post.post.headers[3]" start="8" end="8"></p><div class="post-img"><img class="post-img" ng-src="{{Post.post.imgs[5].attributes.href}}" alt="{{Post.post.imgs[5].attributes.title}}"></div><p my-para="" header="Post.post.headers[3]" start="9" end="9"></p><h3>{{Post.post.headers[4].attributes.text}}</h3><p my-para="" header="Post.post.headers[4]" start="1" end="1"></p></md-card-content></md-card></md-content></div>'),t.put("app/home/blog/post/post4.tmpl.html",'<div id="blog-page" layout="column" layout-padding="" layout-margin=""><md-content><md-card class="blog-card"><img ng-src="{{Post.post.imgs[0].attributes.href}}" alt="{{Post.post.imgs[0].attributes.title}}"><md-card-content><h1>{{Post.post.title}}</h1><p>Posted on: {{Post.post.datePosted | date}}, By:{{Post.post.author[0].attributes.username}}</p><h3>{{Post.post.headers[0].attributes.text}}</h3><p my-para="" header="Post.post.headers[0]" start="1" end="2"></p><h3>{{Post.post.headers[1].attributes.text}}</h3><p my-para="" header="Post.post.headers[1]" start="1" end="1"></p><div class="post-img"><img ng-src="{{Post.post.imgs[1].attributes.href}}" alt="{{Post.post.imgs[1].attributes.title}}"></div><p my-para="" header="Post.post.headers[1]" start="2" end="2"></p><div class="post-img"><img ng-src="{{Post.post.imgs[2].attributes.href}}" alt="{{Post.post.imgs[2].attributes.title}}"></div><p my-para="" header="Post.post.headers[1]" start="3" end="3"></p><div class="post-img"><img ng-src="{{Post.post.imgs[3].attributes.href}}" alt="{{Post.post.imgs[3].attributes.title}}"></div><p my-para="" header="Post.post.headers[1]" start="4" end="4"></p><h3>{{Post.post.headers[2].attributes.text}}</h3><p my-para="" header="Post.post.headers[2]" start="1" end="1"></p><div class="post-img"><img ng-src="{{Post.post.imgs[4].attributes.href}}" alt="{{Post.post.imgs[4].attributes.title}}"></div><p my-para="" header="Post.post.headers[2]" start="2" end="3"></p><div class="post-img"><img ng-src="{{Post.post.imgs[5].attributes.href}}" alt="{{Post.post.imgs[5].attributes.title}}"></div><p my-para="" header="Post.post.headers[2]" start="4" end="4"></p><h3>{{Post.post.headers[3].attributes.text}}</h3><p my-para="" header="Post.post.headers[3]" start="1" end="2"></p></md-card-content></md-card></md-content></div>')}]);