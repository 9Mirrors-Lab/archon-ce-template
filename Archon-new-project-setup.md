Okay, there we go. I think my audio is actually working now. I was looking at my uh OBS and it wasn't showing it. So,
now we're good. Okay. Welcome everyone to the Archon beta launch party live stream. I've been looking forward to
this all week, all month, all summer because we've been working our butts off
on Archon for so long and now we have the beta launch and I cannot wait for it. So, yeah. Okay, let me go ahead and
uh mute my stream on the other monitor there. Cool. So, yeah. What do we got? We got um 28 people watching right now.
Love to see it. Welcome everybody. This is going to be a fun stream. So yeah,
I'm going to give a couple of minutes before I dive into the main content for us here. In the meantime, I just want to
give a warning quickly that there are some really bad thunderstorms that are going on right now where I'm at um in
Minnesota. So, you might hear loud thunder. I might get disconnected. Probably not. I'll probably be okay. But
just like a fair warning that I want to give there. Um yeah. And also, I'm curious before we get started, where's everyone uh tuning in from? I'm curious
if you guys just want to like put in the chat really quick where you guys are at. I'd love to see it just before we get
started here. So, I've got the chat on my left monitor here and then I'll just be like bringing in things from my right
monitor as I'm going through different stuff that I'm sharing today and then obviously presenting from my main
monitor in front of me here. So, that that's what that's what's up. So, if you see me looking around at different places, that's what I'm doing here. Um,
all right, cool. We got um UK, Germany, London, St. Louis, nice. Nice. Egypt,
Portugal, Oklahoma, Jersey, Baltimore, Hong Kong, Austin, Texas, Spain. Oh my
goodness, it's so cool. Okay, I I do this. I ask for, you know, where everyone's at last couple of live
streams and yeah, the thing that just amazes me every time is how global we
are as a community. It's super cool. So, thanks guys for for sharing your location. Uh, and by the way, I have it
set up so I can showcase any given message. Um, and so I'll do
that just as I like answer questions throughout the the live stream today. So I can show any of the the questions.
Colorado Springs, home of Skynet. Love it. Baja California. Nice.
Holland. I'm not going to like showcase every single one of them here, but I'm just showing you guys that I can do that. Also, the other thing that I have
is I can show the chat on my screen as well. And I got some feedback in
previous live streams that it was kind of distracting. So, I think I'll mostly have this off here. Um, but the main
thing is being able to show the featured message. So, that's what I'm going to go ahead
and and do just as we got some questions coming in. Um, so yeah, with that I want
to really quickly talk about the plan for the stream today and just like the
general structure for it and then I'll share my screen and we'll just dive right into things. So first of all, this
is going to be a pretty casual stream. I'm going to be kind of like leveraging Archon as you would as a new user just
getting used to the platform, figuring out how you want to integrate it in your own AI development workflow.
And uh maybe I can actually go ahead and share my screen and show you guys what I mean by that. So I'm going to let me
take care of this quick. Go and share my screen. So I'm going to swap my
Okay, I think my audio. So I had to fix my audio in the new scene here. So yeah, you all should be looking at my screen,
which I need to fix this so that it shows the full thing. Okay, there we go. We're doing some adjustments live, but
that's all good. Okay, cool. Now you guys can see my full screen. Okay, so what we're going to be doing today is
you guys hopefully saw the launch the beta launch video for Archon on Wednesday. Now, I want to dive deeper
into using Archon. We're going to be building something from scratch. I'll talk about how we can use Archon in
existing code bases as well. But I want to start by showing you guys kind of talking about what Archon is all about.
uh just to sort of recap some of the things I talked about in the the launch video on Wednesday. Then I'll I'll
quickly show like how you can get it set up. We'll poke around the user interface a little bit. I'll show like how you
connect it to your AI coding assistant with MCP. Then we'll get into using it
and to kind of more simulate what it'd be like for you guys to play around with it for the first time. I'm going to be
using Archon in a development workflow that I'm not very familiar with myself. So, we're going to be doing some
freestyling in this stream. It's going to be fun. And so, the development workflow that we are going to be
covering in this stream is the BMAD method, which by the way, it is insane
how many comments I get from you guys in my videos and in the Dynamis community asking for me to cover BMAD. So, there's
a lot of love for this. It is a really, really cool framework. Um, just one of the methods that we have for context
engineering. So, I cover the PRP framework a lot on my channel. Um, I've
talked about the spectriven development that we have in AI idees like Curo. BMAD
is another method for context engineering. And so, we're going to be integrating BMAD with Archon in this
stream. And I've done a little bit of prep just to make sure I understand how BMAD works overall, but I haven't used
it ever to build a project end to end. And so, like I said, very much freestyling. I'm going to be playing
around with how I can integrate Archon with BMAD with you guys live so that you get a sense of if you're integrating
Archon into your development workflow. What does it look like to just poke around and experiment with prompting and
using the Archon MCP to really build it into what you're doing already? Like everyone here has an existing process or
at least you're starting to get yourself introduced to using coding assistance. And so I want to make it really easy to
see how Archon can fit in no matter what you already are doing for your AI
development workflow. So that's what we're going to be doing and it's going to be fun. So the first thing that I
want to talk about before we get into this is just you know what Archon is about. And so I'll I'll dive into that
in a second. And I guess the the last thing that I want to say here before we dive into things is
um there might be a lot of like let's just dive into things and and get things
to work. It's going to be kind of scrappy. It's going to be fun, but I don't know for sure if we're going to have something working end to end by the
end of this live stream because more of the point is diving into how we can experiment with integrating Archon into
our workflow versus like let's fully build something end to end. Like I don't have the live stream structured in that
way and I'm doing that intentionally. um for the reasons that I've already been talking about. So I don't I don't want to repeat myself here. The the one thing
I'll say though is if you're interested in seeing my full development workflow in a much more structured way talking
about context engineering and archon and how I use it in my workflow. Something
really exciting that I've got going on um in the Dynamis community and let me I'll actually uh bring this over from my
other monitor here. I'm hosting a half-day workshop, a 4hour workshop.
It's going to be at the end of this month, Wednesday, August 27th. And this is where I'm going to dive into a much
more structured approach. So, it's going to be a lot different from this live stream. Like, this live stream is going to be more casual. We're just building
things, freestyling together. I'm going to be answering a lot of your guys' questions in the chat throughout as well. But, this workshop is going to be
a lot more structured. like I'll dive into my full AI development workflow and we're going to build something from scratch using PRPs and archon. A lot of
the things that I've been covering on my channel is going to be in this very comprehensive workshop. So, if you're
interested in this, like my goal is to make it so that this this workshop alone is worth the investment of Dynamis. And
so, uh yeah, I just wanted to mention that really quickly cuz it's it's very much like related to like here's what
you'd want to do if you like what we're diving into in this live stream and you want something that's a lot more structured. So definitely check out
Dynamus also because the prices will for Dynamis are going to increase after um this weekend. So this is like the
special Archon beta launch weekend and then prices are going to go up after. So I just wanted to mention that quickly. U
but for our workshop right now, we're just going to have a really good time. And so yeah, let's go over to the Archon
repo here. And I'm going to be answering questions in the chat um as they come up as well. So, actually, I'm going to take
a second here and I'm just going to like read through some of the things that we've got in the chat before we
continue. So, um yeah, I'll have basically I'll have time for Q&A as
we're waiting for Claude code to finish certain things like we'll get into the BMAD method and we'll start like
planning our our um solution and architecting it and everything. And so, I'll have time to like look at the chat
as we're waiting for things. So, it's going to be a really smooth stream in that way because there's natural breaks in the the actual like what I'm
showcasing for you guys. Um, cool. Coding with cloud code plus
archon now and it's a game changer. I appreciate it. Yeah, we're going to be using cloud code in this workshop. I'll
talk about how we can use other coding assistants as well. Um, but yeah, cloud code is is a beast right now.
I have to know who came up with the name Archon. Someone should really look at at that up. Um, I came up with the name
Archon. So, I'm curious like why you're asking, but yeah, I thought Archon was a cool
name because um, it's Greek for something. I actually forgot Archon Greek. It means something u, yeah, it
means like ruler or leader. U, because it's like we like you think of archon as
like the operating system for AI coding assistants. Like that's kind of like the catchphrase that I've started to um use
to speak about Archon. And I mean maybe there's like more accurate ways to describe exactly what it is, but it's
just like it's nice and catchy and it's concise. Like it's the operating system for coding assistants. And so it kind of
dictates how we manage knowledge and task for our coding assistants. So it's like the ruler of our context
engineering setup, so to speak, right? So like that's kind of where the name comes from. And back when I had it as
like the AI agent that builds other agents, well, it's kind of like the main agent in that way. So that that's kind
of part of the the inspiration for the name as well. Um, part of the Dynamus community.
Honestly, say I've gotten a ton of value out of it. I just mailed my first agent out of Pantic AI. Congratulations.
That's really cool. I appreciate it. Thank you for the the kind words on Dynamus. Um, so yeah,
love that I'm vibe coding right now as I'm watching. Cole, sweet. Hopefully you're using Archon.
But yeah, it's it's really nice. Like, by the way, just using AI coding assistants in general, something that I
love about them is, sure, it can be slow as you are waiting for it to output the
next uh changes or implementing the next feature, whatever it is. But it's really easy to multitask then. Like you said,
you're watching the live stream as you're vive coding. I'll I'll be like in the Dynamis community responding to things cuz I'm I'm active every single
day in the community. But I'll like be doing that like as I've got Cloud Code running in the background and then it'll finish and I'll go over and like have it
do the next thing or maybe I'll like validate what it outputed and ask it to correct some stuff and then I'll just go back to what I'm doing. So I'm really
I'm able to be efficient with my time. So even if it takes like three or four hours for Claude Code to get through
that like next big thing I'm working on, I only actually have to be dedicating my attention to it like a half hour out of
that full 3 hours, right? Uh it's really nice. So yeah. All right, let's go ahead
and uh dive into Archon. So it is the operating system for AI
coding. And so what that means is it's the command center. So for us, it's a
sleek user interface. Like if I go to the project management for example, we've got a sleek user interface to
manage all of our tasks. We've got a place to manage the knowledge that we want to give our coding assistants. So I
can perform rag to like actually search through the pyantic AI documentation or the cloud code documentation. So it's a
UI for us to manage everything. And then for the coding assistant, it's an MCP server. So it's kind of like leveraging
what's native to humans and what's native to coding assistants. So we all can work on the same set of context as
we are context engineering. That's the beauty of it. And it's possible to connect it to any AI coding assistant
that supports MCP. And so we have instructions if I go to like the MCP server tab. And I'll talk about how you
can get this all running in a second by the way. Uh but like we have a tab for all the popular coding assistants. And
um really just to keep the UI concise, we didn't include like 20 different coding assistants, but you can connect
this to every single coding assistant basically. So we have instructions for popular ones like Klein and Claude Code
like we'll be using today. I'll actually copy this command right here. So this is the command that you run when you have
Claude installed to hook in the Archon MCP server. And um actually maybe I'll
actually just go ahead and do that right now. So I've got my terminal open. We're going to be living and breathing in this
terminal today as we do our demo. And so to add the archon mcp after I have it up
and running, I just have to run this command. Like it's that easy. And I already have it running, which is why I
get this message right here. But if I do a claw mcp list, then it'll check and even validate the connection to archon.
So that's how easy it is to get it connected once you have the UI up and running. And I I cover instructions for
like how to set up everything in the video that I put out on Wednesday. But really, if you go to this link, so you
can just go to the Archon GitHub repository. Also, if you just go to the URL archon.diy,
this will take you to the GitHub repository as well. So, I have a a URL that just like redirects you right to
the to the GitHub repo, so it's really easy for you guys to access it. Um, so yeah, just archon.
Why? And then in the read me here, I have your quick start instructions. So, super super easy to get started. There
are a couple of things that people have been tripping up on that I want to address really quickly. Uh because honestly, like if you guys want to
follow along in this live stream as I start using Archon, I'd welcome it. Um and so, yeah, prerex, you just need to
have Docker Desktop. Uh you need a Superbase account. You can the free tier works like you don't have to pay
anything to use Archon. Um or you can even use local Superbase. So like if
you're following along with my all my local AI stuff and you have the local AI package up and running, you can use that
superbase. Um and then also you just need your API key for OpenAI. We also
support Gemini and Olama. So Olama is kind of more experimental right now. It's in the works. U but we are we have
actually an active effort on that with a PR coming into Archon soon as well. And
that's kind of the other big preface I want to give for Archon is like when I say that it's in beta like there there are things that are like not working
100% at this point and there are more experimental parts of the platform that
um we have like things that are saying coming soon or it just does like it needs to be tidied up. We're working on
that. Like I'm I'm putting in a lot of my effort a majority of my effort into archon and everything related to context
engineering that I have like kind of playing into archon. So yeah, these are the prerexs and then you just have to
clone the repo and then set up your environment variables and really it's just you have to get your superbase URL
and service ro key and maybe I could actually show that really quick as well. I feel like that'd be useful just for
the people that have been tripping up. One thing that I've been seeing a lot is um people are using their anonymous key
in Superbase instead of their service ro one. And so I'm just going to bring over my superbase here and show you what I'm
talking about. So, I have a just like a basic $10 a month micro instance set up for a lot of the testing I've been doing
with Archon. You just go to your project settings in Superbase. And when you go to the API key section, you just reveal
and copy the service role key. So, that's the key that you put into the environment variables for archon. And
then for the data API, you get your URL here. And then you can do a similar thing for uh self-hosted superbase. You
just get your values from the environment variables. So, not to dive too much into the setup right now just
because I covered that in the video on Wednesday already, but I wanted to at least call that out cuz a couple of of
uh issues have been created around that. Um, so yeah, and then once you have your
environment variable set up, you can set up your database. And so within the migrations folder, I've got a single
script that you can run. You can copy this script, go into your Superbase SQL
editor, and you can create a new snippet, and then you just paste this in and run it. So, this is going to create all of the archon tables for managing
your knowledge and your tasks and your documents. Uh, very, very easy setup. And then I'll go back to the readme here
u because then the last thing is to build spin up the containers. So, you just run this docker compose command. We
got docker as one of our prewax for this. And so you run that and it'll spin up all the containers and then you have
everything running for Archon. And so what that'll look like in your Docker desktop is you'll have four containers
running under the Archon umbrella. We've got our agents which this is a feature that is more coming soon. But then we
have our MCP server, the user interface that we've already been looking at a bit, and then we have our server that has all of our API endpoints so that our
UI can interact with everything that the MCP server can for our coding assistant.
So that's what the setup looks like. And then if you go to localhost port 3737, that'll take you through an onboarding
flow where we have you set your OpenAI API key. Um or you can just skip past
that and then go and set your uh Google API key. So we support Gemini as well. And then Olama, like I said, is
experimental coming soon. So a lot of things that we're working on that are coming soon. Um it's like things like
Olama. So yeah. Uh, and then once you're in Archon and you have everything set
up, this is where the fun begins because this is where we can start to scrape knowledge and get our global rule set up
for Archon. This is where the fun begins. And so, yeah, um, to start, I think now is a
good time. I'm I'm going to kind of like treat this as if I'm using Archon from scratch. So, I have some things that are
crawled already that I'm going to be using in the the demo today, but I'm
going to act like I don't have that. And so, I'm going to start from scratch, talk about like what we're going to be building, and I put a lot of thought
into just having like a really cool use case for you guys. And then, we'll get into the BMAD method. We'll actually
start more with BMAD and then start seeing how Archon can play into it because I want to show you guys how your
existing strategies work with Archon. So, what we're going to be building today is going to be something kind of
like this tool. So, if you guys haven't heard of Claude Code UI, and there's a
lot of tools that are like it, it's basically a user interface. So, like in mobile and on the web, we can manage
different Claude Code instances. And so, I'll open this image in a new tab so you
guys can see kind of like like what what I envision creating. And again, we might not like have an end result that looks
like this by the end of this stream because I want to focus so much on like answering your guys' questions, talking
about Archon, and integrating with BMAD, but we might get something kind of like we'll see. But this is kind of what I'm
envisioning here where we have a user interface. We'll build a website with Nex.js JS where we have just like an
easier way to manage the our cloud code instances and we'll use the cloud code SDK that they offer so that we can build
our own application that is invoking cloud code and we can manage um the
different instances at the same time. We can see like a log of the terminals that we have open and all the work that
they're doing which is also going to be a cool way to manage sub aents by the way within quad codes. you can have them
all running at the same time and managing them separately and like having that integrated with Archon as well. So
like this is kind of just to give you guys like a rough idea of what I'm envisioning here, what we're going to create together. Um just to give you a
demo of BMAD plus Archon and yeah, Cloud Code UI is not a tool that I've actually
tried myself. I've used other similar ones, but I just found this one recently and I thought that this was like a they
just had nice screenshots showing what it looks like. So, I thought it'd be a nice way to give you guys a visual of
what I'm hoping to create because obviously I can't give you guys a demo of something like I do in my YouTube videos because in my YouTube videos,
I'll fully build it out first, then I'll record basically like recreating it. So, that way I can like give you guys a demo
up front and then create basically a replica so you see the full process. So,
that's what it looks like in something a lot more structured like a YouTube video or like that workshop that I have in Dynamus coming up here. Um, but then for
this live stream, we're just freestyling. So, that's what I want to create. So, all right. Now, we can dive
into BMAD. And, uh, by the way, once we start using BMAD, that's when we'll have
more natural breaks for me to take a look at the chat here. So, I have the chat on my left monitor. I see that it's
going crazy. I appreciate all you guys being here and commenting. So, I'll definitely be diving into uh some of
your guys's questions once uh we got some things running in cloud code. So,
let's start with a little intro to BMAD and then once we start looking into how we use it, that's when we'll really
start to see archon play into it in a way where like I think you guys will be able to use your imagination to see how
archon can fit into any AI development workflow. So BMAD it is the foundation
of agentic agiled driven development and um yeah actually I think 125% is a good
zoom here. So I'll stay at this level of zoom. Um so there's kind of two main
workflows that we have with BMAD. Essentially what BMAD gives us is a bunch of different sub aents that are
experts at different parts of our development workflow. So like in the agentic planning workflow, we have our
analyst, we have our project manager, we have our architect, and then when we go into development, we have our scrum
master agent that's kind of guiding all these different development agents to knock out the different stories like the
different tasks that we have for developing our project. And there are some diagrams that we have in the user
guide here um that walk us through what this workflow looks like. And yeah, so
the the BMAD method in general, it's like I said, it's a strategy for context engineering and it gets pretty in-depth.
Like these workflow diagrams, like these mermaid diagrams, they look kind of
intimidating. Like there's a lot that goes into this here. So um yeah, by the way, like this first one is the planning
workflow. And we're going to walk through this and I'll show you how to integrate Archon with this. It's not as complex as it looks. This is the
planning workflow. Then once we get into development, we have this second
workflow, which I might go through this one or I might actually switch to PRP. Um, we'll see. Like I said, we're
freestyling here. So, two different workflows that we have for the BMAD method. And the guy that created the
BMAD method, he he's a genius. Like, he's very, very smart. And he's actually
got a YouTube channel where he started covering BMAD. I went through his entire 1 hour and 15 minute master class that
he had on YouTube. By the way, if you just search the BMAT method, you'll find him. Um, but yeah, he's done so much
research into project management and best practices for architecting and different like mental models that we can
apply to planning projects. And he's done a ton of research into best practices for prompting at different
stages of our AI development workflow. And he talks a lot about that in his master class as well. And so I I just
think this is a great use case. So like apply BMAD with archon. And the other thing that he talks about is the whole
idea of um green field versus brownfield projects. So a green field project, you
can think of it like fresh green pastures. This is a new project that you're starting from scratch. And then
brownfield is when you're working in an existing codebase. And the BMAD method has different workflows depending on if
you're working on an existing codebase or not. And I know that that's something that um a lot of you guys like in
comments in my videos and in the Dynamis community have said like I want to see more of like let's use
AI coding on an existing project versus something that is green field. And so
generally I focus on green field new projects just because it's a lot easier
to show how I apply different strategies. And it's going to be the same in this live stream. on creating
something from scratch because going through the full planning workflow, it's much easier to integrate Archon and show
the different parts of Archon when we're doing a lot more of that like initial research and task management. Um, where
we're it's going to be a lot more sparse if we're just like adding new features on an existing codebase. There's going to be less tasks overall. There's going
to be less research that we have to perform with Archon and like all the knowledge that we have for Rag because
it's going to be more looking at the existing codebase versus looking at documentation. You see what I'm saying?
Like brownfield projects, it's more let's reference the existing codebase to figure out the patterns that we need to
develop. With a new project, it's let's look at the documentation for Pantai, for example, to figure out the patterns
for developing agents that are that's recommended for this library. So that's why we're going with green field here.
But yeah, so let's let's go ahead and start actually. So let me go to VMAD. We'll go to the quick start here. Let me
do a time check as well. Okay. 25 after um
Okay, I I'm going to look at the chat quick before I
um continue. Let's see. Archon is amazing. The UI is
clean. Appreciate that a lot. Really want to see this work with an existing BMAD project. Yeah, I mean I'll be I'll
be speaking to that like I'll we'll do like the like a help command that we have for the different sub aents in BMAD
and I'll show you like how you would do things a bit differently for a brownfield project and I've already kind of talked about it as well. Like the
main thing is for context engineering on an existing codebase you're referencing a lot of your existing codebase for like
best practices and architecture versus with a new project it's more documentation that you upload or you're
crawling like what we're doing with Archon. So, uh, my OpenAI bill ended up being 3K.
That is unfortunate. That's not from Archon, though. Um, if you're saying that's from Archon, that's
not true because we don't uh we're never going to do anything with your API key. And it's stored, all the credentials for Archon are stored encrypted in your own
database, your superbase. So, yeah.
Um, okay. I I realize there's some drama going on here. Um,
I'm going to I'm going to move past that. All right. All right. I'm just going to move past that. Uh, oh, Sean's popping
in. What's up, Sean? Let me go let me go to this. Where is it? Was a great master class. I appreciate it, Sean. Thanks for
being here. So, Sean is one of the other maintainers of of of Archon. He's the one who built the beautiful user
interface that you're looking at right here. So, yeah, thank you, Sean, for being a huge part of Archon and doing amazing things. I would not have been
able to build this in user interface that you did.
All right. Oh. Oh, yeah. Yeah. One thing that I I appreciate you bringing this up, Nicolay, uh adding support for open
router. I saw there's a PR for that. I really prefer open router over all providers. Yeah. So, one thing with
archon is it relies a lot more on embedding models than large language
models. most of the things that we do with rag and I'll actually show this by the way guys um for crawling here we for
the knowledge that we want for this project we're making this like let's manage cloud code instances in a UI we
probably want the documentation for cloud code so we know how to use the cloud code SDK to interact with cloud
code from our NexJS application and so I can actually take this link right here.
This is actually what I already have um scraped. And so I'm just going to do a recall here so you can you guys can see
what this looks like in action. But I go to the knowledge here. I paste this in. And Nicollay, I'll get to your question in a second. Don't worry. Um well, I
just realized that this is like smashing. You can't guys can't even see my face right now. Um
let me move this. No, it's it's fine. Um it's all right for now. Uh anyway, so I add in the URL
for cloud code. I want to scrape this documentation. And you click add source. Now, I'm not going to do this here
because I already have it crawled. So, I'll just do a rec crawl so you guys can see what it looks like.
And so, what it does behind the scenes is it uses crawl for AAI to recursively
navigate through all the URLs that we have. So, it starts with one URL and you see that it moved all the way up to 40.
Excuse me, it moved up to 45. So, it found all the URLs. It's crawling them in batches of five. You can see the
progress going up right here. And then it's going to with some more advanced chunking strategies that I have
implemented behind the scenes. It's going to use an embedding model to chunk up and uh create the vectors for all of
the documentation that we've crawled here with crawl for AAI and we're storing that all in our superbase database. So we're using PG vector uh
for semantic search and storing the embeddings. And it's really cool how we can watch in
real time the progress of the crawl here. And we also have a gentic rag. It's extracting code examples as well.
So, we're giving like a couple different ways for Archon. Like with our AI coding assistant using the Archon MCP, it can
search through the documentation in a few different ways. Like it can just look up the raw docs with a search or it
can look at the code examples. It can search through the code examples that we're extracting as well. So, it's an implementation of a gentic rag where
there's multiple different ways that our coding assistant can search through what we've crawled. And so, all that to say,
I just wanted to to show you guys an example of that. All that to say, nicicolay for open router, it is a
fantastic platform, but they don't have embedding models. They only have large language models. And so, the reason that
we started with OpenAI, Gemini, and Olama is they are the three most popular providers that have both LLMs and
embedding models. And so, like right now, I'm using um text embed 3 small
from OpenAI. That's what's doing the the chunking here. And then for the large language model to extract code examples
and provide summaries, I'm just using GPT 4.1 nano. So it's just like a super cheap and lightweight model. This entire
crawl, by the way, guys, is like a tenth of a penny or less for everything. Like
it is so so cheap. Everything you do in Archon because it's all like embedding
models are incredibly cheap compared to LLMs. And then our usage of LLMs here is very light and I'm able to do everything
with just GPT 4.1 nano or you could use like GPT5 nano. So there we go. We're
crawled. We've got the docs. We can look at the code examples that they have here which aren't really the best for cloud
code. If I were to go to like pideantic AI, it looks a lot better. Like we can see like full code examples that we've
extracted from the documentation here which is just so cool. And we can see this all in the UI of Archon. It's a
beautiful thing. Um, so yeah, what we're planning on doing, Nicolet, um, I need
to remove the message here. What we're planning on doing for Open Router in general, we want to make it so that
you can set your LLM provider separately from your embedding provider. So that way you could use Open Router for the
LLM and then you could use OpenAI or you could use Olama for your embedding model and you would just set those things
separately. So we're working on the settings quite a bit and making changes like that. Also just making it easier to
configure things like having a automatic dropdown for the models that are available versus you having to type it
yourself. So we're working on a lot of things like that. So trust me guys there are a lot of features that are coming soon for archon. So yeah we've got our
documentation crawled for uh the cloud code docs and then I also because we're building a nex.js application I took the
llm's full dash or llm-full.ext from nex.js and I crawled this as well.
Now, this one takes a little bit longer. There's a lot of text here. If you can see my scroll bar on the right hand side
of my screen, this is a lot of information. So, it took a while to crawl it. And so, to save you guys from
having to go through that and we already saw crawling the cloud code docs, I have this crawled already. So, we we have 471
code examples that we have pulled from the docs here. So, we've got all of our knowledge primed for cloud code and
nex.js. And we'll start to see this in the BMAD method in a second here. will leverage this documentation even in the
planning process. So going back to BMAD here, I'm going to copy the command to get
started. And so it's super super easy to get BMAD started in any project. Um, all
you have to do, and I mean I've already run this, and so I'll probably just do it on a new folder, show you guys what
it looks like, and then I'll go back to my current folder where I already have BMAD set up. I think that'll be the best
way to do it. So, let me go and get things set up in a new folder here. Okay. All right. So, I take that command
from the repo. It's just npxbad method install. Super easy. And it's going to install the following packages. That is
good. All right. BMAD method. And then the first thing you want to do is enter the full path to your project because
essentially what BMAD will do is just it's going to install a bunch of
configuration and sub aents like a lot of different markdown files to get us set up with BMAD in our codebase. So
this can be an existing codebase that you install BMAD into or in our case it can just be a brand new folder. And so
I'm going to pass in a path here. I'll call it uh BMAD example.
There we go. And then I'm going to install the full system here. And uh
will the PRD product requirement document be sharded into multiple files? Yes. Is the default. Just go with this.
PRDs. By the way, guys, this is like the document that has like a very fully
written out spec of what you want to create. So when we plan our initial
implementation, we put that in a PRD that we'll then use to break into tasks and start implementing. And we'll see
that in action as well. So I'm going to say yes. Will the architecture documentation be sharded into multiple
files? Sharded just means split up to make things more concise by the way. So yeah, now we get to pick the IDE that we
want to configure because based on the coding assistant, there are different ways that we need to set up our global
rules and set up our sub aents, things like that. So I'm going to pick cloud code. So select with spacebar and then
confirm with enter. You can install this in multiple ones, by the way, but uh I'm just going to go ahead and put this in
cloud code. So, there we go. Enter to confirm. Uh pre-built web bundles. I
don't really care about that. So, I'll just select the default. And then it says the directory does not exist. Would
you like to create the directory and continue? I will say yes. There we go. All right. Boom. Super super quick. So,
there we go. We have everything created. So, it created some agents for us. So, we have these different commands that we
can use to invoke these sub aents. So like for example when we are first starting our project and we'll see this
in a sec when we want to start planning things we'll call into the analyst agent that BMAD gives us and we'll use the an
the analyst will actually leverage archon to crawl through the documentation for cloud code in Nex.js
JS to help us create some kind of more like initial pseudo code like that first
layer of like okay let's think about generally how we want to structure the codebase and we'll actually use archon
with the analyst to do that and then the analyst is going to output a brief like a project brief that we're going to
store as a document in a new project in archon so that's kind of a little teaser for what we're about to do here um but
yeah whenever we do this and we create a new setup with BMAD I'll open my VS code
and I'll show you really quickly what this looks like in general. So that's going to create this uh BMAD core
folder. So this this works on an existing project as well. It's not going to like overwrite anything in your codebase. It creates a new folder where
we have our different agent teams, our agents. We got the core user guide here.
These are all the files that are going to be referenced by our agents as we call upon them in our development
workflow. And so like here's the markdown file for the analyst agent for
example. And so yeah, basically like we have each agent starts with an activation notice.
So it's like when we call upon the analyst agent, here's what you got to do and then here are the steps that you
have to follow to act as the analyst agent. So when we tell Claude code or
cursor or windurf whatever to act as this agent, it reads this file and then
basically uses these instructions to change its persona. That's how we're doing. So it's not the BMAD doesn't
actually use like the slash agent feature in cloud code. And the reason for that is it's more of like a general
implementation so that you can use basically sub aents as prompts in any
coding assistant. Even the ones that don't have sub aents built into it. And so yeah, sub agents, if you guys didn't
know, sub aents, even in cloud code, it's really just prompts. like you have some file that you tell Claude code to
look at and you say read the instructions here to act as this persona. That's all we're doing here.
And so we're telling it that like you your name is Mary, you're a business analyst. Uh here is your role and your
style. Here are your core principles. And then here are the different commands that a user can invoke. Like we have our
help command. We have our command to create our project brief, which is one of the first things we're going to do. So that's essentially how BMAD works is
we have all these different agents that are fit together in this workflow that I was showing you guys in the mermaid diagram earlier which was um if I pull
that up quick I'll just reference that for you guys again. Um that is this diagram here. So the
analyst is at the beginning here and so we can go ahead and invoke this. And so let's let's just dive right in. So I'm
going to clear and then I'm going to enter in a cloud. And by the way cloud MCP list remember we've got archon
connected already. I showed you guys how to do that. Maybe I didn't kind of do it in the right order. Like I showed you how to connect Archon, then I went
through like setting it up, but yeah. So, we we we connected it with um this command right here, assuming we have
everything up and running. The MCP for Archon is on port 8051 by default. And
you can configure that as well if you want. So, yeah, we'll jump into a cloud session here and let's get right into
it. And so, I've I came with a little bit of prep. Um so, I know some of the commands that
I want to run here. So, I have that referenced on my other monitor here just to try to make this smooth. Um, though we are mostly freestyling like I haven't
done that much. And so, the first thing that we want to do is if you just do slanalyst and then you press tab, we're
going to start Mary as our analyst and it's going to help us create our brief
for the project that we want to create. So, there we go. Slan analyst. Hello Mary, your business analyst. Specialize
in blah blah blah. And then type help to see my available commands. So we can do star help and then Mary is going to be
prompted to give us the commands that she has everything that we had in the um that markdown file that I showed you.
And while she outputs that, the other thing I want to show you guys, if I go back to Archon here,
we have the global rules that we want to create for Archon. So in the settings,
and you're going to want to do this whenever you use Archon, we have the IDE global rules. And so based on if you're
using cloud code or not really there's just like special instructions for cloud code that we have and then the rest of
your coding assistants can use the same rules here. You can just copy the cloud code rules and then you can either
create a new cloud MD and paste these in along with the typical global rules that
you use or if it's an existing project where you already have global rules then you'll just paste in the instructions
for archon along with everything else that you already have. So whether it's your cloud.mmd or your cursor rules or
your wind surf rules, this is just part like this is the part of your global rules now for archons. You can add this
in with any of your other existing global rules. So I just wanted to call that out really quickly because I have that set up in this repository already
or this folder already. Otherwise, I literally just have my global rules and then everything for BMAD and then some stuff for PRP that we'll get into
towards the end here. So that's what I have set up right now. So going back to the terminal here, here are the commands that we have for the business analyst.
And so uh we can create a project brief. We can go into YOLO mode, which I I saw
someone in the chat was asking about YOLO mode. Um YOLO mode is instead of
like it working alongside you more to plan your project, implement your project, it it operates more
autonomously. So if you want to just trust it more with the implementation, that's what YOLO mode means. We're going to do some of that here because I want
to be pretty concise in going through the BMAD method here. But the first thing that I want to do is I want to
brainstorm. So I'm going to use the brainstorm command. So you do like uh star brainstorm. So the star is just the
way to like signal that we were invoking a command here. That's just the convention for BMAD. We do star
brainstorm and then we just send in a prompt for what we want it to research. And so what I want to do, I have this
pre-selected just so you guys don't have to see me type it out here. I want to create a Nex.js front end where I can
spin off and manage different cloud code instances through the cloud code SDK. And I'm speaking to the specific pieces
of technology, cloud code and nex.js that I have the documentation for in archon. And so we'll see in a little bit
how I'm actually going to ask Mary to reference the documentation through Archon so that we can get a better
planning. Basically just get a better brief outputed. So all right, she's
going to do some brainstorming for me here. Um, and let's see, there's one
other thing that I wanted to cover. Uh, yes. Okay, so I'll show you guys really
quickly. So, exactly what we walk through here. It's going to be kind of similar to this project that I have in
Archon. And so, I did a little bit of testing ahead of time. Um, so we have
this project in Archon where we have all these different tasks. I actually had one of the sub agents in BMAD make
these. It's not the same process as what we're going through right here, but in the docs tab, the docs in Archon is one
of the more experimental things that we don't have super tidied up at this point. But what you can see here is like
the project brief that we're about to create with our business analyst. We're
actually going to store this in archon. So the beauty of archon is it can be our place not just for task management and
knowledge like we've been covering but also our place to manage documents and share it with our team. Like you can
actually have your superbase instance that you have many different people
pointing to with their archon instances. You guys can share tasks and share documents and we can have our coding
assistant upload the brief here and then pull it later to go and create the PRD. We'll see this in action in a little
bit. Um, so yeah, I just wanted to show that quick. And then going back to our business analyst, we are we're done. So
we have our output here. Technical architecture considerations. We here's our front-end stack. Here's our backend
requirements. So we're just doing a little bit of the brainstorming initially for what needs to go into our project. That's what our business
analyst did. So there we go. So now there's quite a few different things that we can do
after the brainstorming just based on those same commands that we saw when I did the help command earlier.
And so what I want to do is I want to do a uh I want to create a project brief.
So I'm going to do create project brief. That's just one of the commands that we
have for the analyst. And I'm going to say, well,
let me see. Um, oh, no, sorry. I can just say two. I want to do command
number two because instead of Yeah, like it it's I'm just going to like go through the flow that it's walking me through here and just kind of trust it
more. So, I'm going to say two. I want to create a detailed project brief for this concept. And the analyst here is
prompted to guide me through it so that I can really be a part of creating the brief. It's not just going to go and off
and do it all itself. And so in a second here, we'll see it maybe ask a couple of follow-up questions for us.
Um, so let's see. All right, we got some output here. So
it's starting to it's got the executive summary here. So it's starting to do some planning. We'll see if it I mean
it's kind of it's not always the same how the analyst works. Like sometimes we'll ask people more follow questions,
sometimes it won't. I mean, the BMAD method is not always going to like perform the same because LLMs are just
unreliable. They don't always do the exact same thing. Like, they won't always ask me the same follow-up questions. So, I'll just kind of let it
rip here and uh we'll get through our project brief. So, yeah, I'm going to go through some of the questions that we
got in the chat here. And I definitely won't be able to get through like all questions, so I'll just do my best to
hit on a couple of them at a time as we're waiting for Cloud Code to finish.
Um, let's see. So, I cloned Archon yesterday, configured Docker. When I go to local host 3737, I get the errors
below. Anything I'm missing? Uh, when you get failed to load credentials, that generally means that you either didn't
set things up in your database or you're using the anonymous Superbase key instead of the service roll one. And so,
this error um is yeah, one that we've seen quite a couple of times. So, you're
not alone. It's all good. You just have to make sure that you going back to superbase here. You need to be using the
service ro key that we have in superbase not anonymous. And then also going back to the instructions for setting up cloud
code or not for setting up archon. You just have to make sure that you run the
database setup in your superbase. You'll get those errors if it can't find the tables in your back end. So those are
the two things that I would say. Um yeah and and I I know that like for some people that have submitted some issues
for related things they generally come back and say like oh yeah it was one of those two things and that fixed it for me. So yeah just give those two a shot.
Um but yeah let's see. All right cool. So we got our project brief. It is done now.
So let's see what we got. Uh quite a bit here. So we got success metrics and
KPIs. We've got a timeline and milestones. So Mary is very much acting like a project
manager here, outlining really important things like what's the timeline for our project. I mean, this isn't actually
going to take 24 weeks. This is this is hilarious. It's not going to be 24 weeks. I promise guys, you're not stuck in this live stream for 24 weeks. Uh but
yeah, we got key milestones, risk assessment, resource requirements, which I mean this isn't really accurate
to what we're doing here. I I guess maybe if we create like sub agents for each of these things, I suppose. Um, I'm
about to spend $200,000 on development. That's kind of funny. So may maybe the
prompting for the business analyst could be a bit more accurate to like actually integrating this in development workflow, not with like a real people
that we have to pay. But you guys get the idea in general. Like it's pretty cool how we have this entire project
brief. And so the next thing that I want to do with this brief is I actually want to refine it and then store it as a
document in Archon. So, we'll start to see more how archon is integrated with
uh the BMAD method here. So, okay, I'm going back to my instructions here. I'm trying to remember exactly what I want
to do next with this. Um, yeah, let's see. So, I'm going to I'm
actually going to run the the help command again. So, I want to remember what commands I have. Um,
and then also there are some follow-up questions that we've got here. create user stories, develop competitive
analysis, which I'm not really interested in doing that right now. Generate technical implementations.
Um, what else could I do? Um, and actually, did they did the
project brief get created? No, it didn't get created yet. Okay. So, I'm going to let's just say this. I'm going to say
use archon to uh search how to leverage the cloud code
SDK. and then
add technical implementation ideas to the project brief and save that
brief in a new project I want you to create in Archon. Okay, so here we go.
This is where we really start to see the integration here. So, we're going to have Mary instead of just going through the typical flow that you do with the
BMAD method where you store all your documents in your source control like just in your your project folder, we're
going to actually have her use archon. So, she's going to do some research on how to leverage the cloud code SDK so
that she can help me generate a more technical implementation plan and actually do it based on the cloud code
documentation instead of just like simple research or hallucinating something random. It's going to use
archon. That's going to help a lot. And then we'll store the brief in Archon as well, and we'll do that in a brand new
project that we create. So, going back to Archon here within a single project, we've got the tasks tab, and then we
have the docs tab. So, we'll see Mary create a new project in Archon. In a
second here, this will pop up and then there'll be a project brief as well. So, first of all, before she does that,
she's going to search through our documentation. So everything that we crawled like I showed you crawling the
cloud code um the cloud code documentation in real time that is what we're searching through using the archon
mcp. So we're performing rag queries and then we're also searching through the code examples that you saw being
generated as well. So I'm going to do if I do controlr and cloud code we can zoom
into the output of our different rag searches. So like when we searched for code examples, we were looking for
TypeScript implementations and um let's see what we got here. Trying to like I
mean there's just a lot of information here. I mean it's okay that we don't have to like understand all this in detail but the coding assistant
definitely needs to. So let's go up to uh the first chunk that we retrieved.
So uh let's see. It's kind of hard to like
Okay, so here we go. We got some some implementations with the cloud SDK. So, it's pulling things from the cloud SDK,
which is good. Um, and then we got some things for the TypeScript SDK. So, that's what we actually care about using
here. U, so this is good. We're getting some of the code examples. And I'll do control R to go out of this. We don't
need to like dive into that forever here. Uh, but the important thing is if I go back into Archon, I didn't even
have to refresh my page because we have websockets. So, there's real time updates with Archon through the MCP and
the UI. We have our cloud code instance manager Nex.js control center project. So there we go. We got a a blank slate
here. So we got no tasks at this point, no docs, but we're about to create the brief. And so we'll see that here. Now
we'll add the enhanced project brief with technical implementation to the newly created project. So now Mary is generating that project brief. And once
it is generated, we can uh go back into Archon and see that. So we'll have to wait a little bit because it's usually a
pretty long document. So, I'm going to give it some time to generate. I'll go back to the chat here.
Um, okay. The first comment that I landed on is actually what I wanted to
speak to next. So, thank you Maxim for for asking or for saying this. An archon
specific version of be mad would be mad. And I agree 100%. That is actually one
of the um Well, there we go. A screen was flashing for a second because the uh brief was created. So we we'll dive back
into this in a second here. Um yes, one of the big things that we want to do for Archon is take different strategies for
context engineering and either create a guide for how you can integrate Archon
very closely with that strategy like BMAD or PRPs or spec spectr development
or actually build it into the platform where there's going to be like some toggle or some like select that you can
make in archon where it'll like overhaul the UI so that it's optimized for that specific strategy. That would be so
cool. So so cool. Um so that is what we're we're one of the big future
visions that we have for Archon. Um someone's asking is the sound cutting
out for you guys. Sorry if there maybe maybe it's because I'm like moving my head around. So if I if I stay close to
my microphone, it probably won't cut out as much. So I'm sorry about that guys.
Um yeah, I'll I'll just keep my face close to the microphone here. Okay. Anyway, so yeah, let me let me go back
to Archon because I want to pop this up for you guys here. Um, first of all,
first of all, we've got our project brief created. So, I'll dive into this
in a second here. This was just created by the BMAD agent. So, I'll dive into this in a second. But the other thing
that I wanted to to talk about uh just going more off your question Maxim is in the settings here I envision a a place
in the future where it could be like the context engineering strategy you want to use with archon and then there'll be
like um checkbox for PRP or like a checkbox for BMAD like something like that where then it'll then like optimize
things under the hood like maybe it'll give you global rules that are specific to working with BMAD and then like maybe
there'll be like different um tweaks to UI that we have. So, the way that it's organizes like documents or tasks works
better with BMAD or the way that it like displays the project brief, for example. Like, there's so many things that we
have. The other thing that just gets me so fired up about Archon. Um,
sorry, that says the audio is choppy. Yeah, guys, if you refresh the stream, that might help. Um,
Justin said reconnected fixed audio for me. Thanks, Justin. Yeah. Um, sorry
guys. I don't know why it's cutting out. I mean, it could it could be because of the storms that are happening. Like I I
preface at the start of the stream. That's kind of the only thing I know. So yeah, maybe reconnecting and and hopefully that'll help it. You could
just refresh the stream and um that'll help it like just refresh your browser
page. Um so yeah. Okay. I got distracted there. I got to talk about uh what I was
just about to say with Archon. The thing that gets me so excited is not just like how awesome it is right now and and
thanks to people like Sean and Raasmus for helping out with Archon a lot. Um, so I'm not like tooting my own horn. I'm
just saying that like we've built something awesome together and and a lot of contributions from the Dynamis community as well. But the other thing
that makes me so excited about Archon is just how many different things we can do with it in the future. Like Maxim said,
we can integrate with different context engineering strategies. Also another thing for Archon, one of the big future
visions I have for it is it would be amazing to make Archon into this command
center for not just task management and knowledge, but also for like all things
context engineering. Like imagine going into a new project um or even just like a brownfield project like you're going
into an existing codebase and you want to implement context engineering for the first time and you're like man I don't
even know where to start with my global rules and my sub agents and my hooks and my PRP template like what knowledge do I
even need? Like I don't even know where to start. And like that's something that I know that a lot of you struggle with and have told me in the community and in
my YouTube comments as well that like there's so many things for contact engineering right now that it's kind of overwhelming. Like I just want to go
into my coding assistant and have something set up for me where I have this optimal workflow for leveraging a
coding assistant and I don't have to like struggle through all these different things like let me set up my global rules and all let me set up my
context like it can kind of become a lot. And so the the dream that I have for Archon is making it so that we can
kind of like integrate the context engineering hub that I've been working on where like I have different like PRP
templates and I have these like different use cases that I've showcased on my channel. It'd be awesome to build
this out and then integrate it with Archon. So basically you can come into a new project and you can say I want to
make a Nex.js application to work with my cloud code instances like what we're building right now. And then Archon is
going to find the right example in the context engineering hub here. It's going
to go through these like templates for global rules and be like, "Oh, here's your global rule template for next.js."
And then, "Oh, let me go and crawl this documentation for you because you're going to need the next.js documentation." And oh, let me go and
create a project for you in Archon and set up some tasks to help you start this project. and like basically setting up a
project from scratch with everything you need for context engineering. Rag, your documentation, your tasks, your global
rules, your sub agents. Like it maybe there's like a repository of sub agents and it'll pull a couple of them that it
thinks you need for your project. Like if Archon can do that, it is going to be just like the best thing for AI coding
ever. And that's the vision that I have for it. Like that plus integrating with different strategies for context
engineering. Like I really want it to be the MCP for context engineering.
Yeah, a lot of plans. And and by the way, this isn't like just my vision.
It's something that um a lot of us have been talking about like just in the Dynamis community. And so um I I know
that I um I didn't say this yet, but I meant to. We had an alpha release of Archon
before we actually brought it into the beta release for everyone publicly. So there are a lot of people in Dynamis
that were trying it out at first and giving us some ideas and like really helping us shape our vision and working
through some of the initial bugs and things which I mean there's still bugs in Archon. We're working through those but like helping us get through that
alpha phase. And man, it's just like there's like an energy happening in Dynamis. I just got to say there's an
energy around like everyone envisioning like how we can take context engineering further and take Archon further. Like
that's something that I hope that you guys would want to be a part of. And so yeah, I just got to say again like I'll
pull up the um let me go back to my browser here. I'll pull this up again. Like kind of this workshop here that's
happening uh the August 27th the end of this month here. It's kind of like a culmination of a lot of different things
that we've been doing in Dynamis around context engineering and PRPs and archon. And so, yeah, if you guys want to dive
like really really deep into these things, I know like I have like concise guides on YouTube and things and like
those are nice, but if you really really want to dive deep, like that's where that's what Dynamus is for. That's what
I've got going on in Dynamis and we're all just like shaping the vision behind Archon together. And so, Archon is a
fully open- source project and it's something that we all can work on together, but there's definitely like a
next level of energy in the community. I guess it's just the best like it's kind of hard for me to think about how I want to like phrase or how to even like
explain that, but there just is like a next level of energy that we have in the community for the ideas that we're sharing with each other and and also
just the ways that people are talking about how they're using Archon and using BMAD and PRP and things. Um, so yeah,
just like a gold mine of ideas being shared with each other constantly. So yeah. All right, let's go back to our
terminal here. Definitely check out Dynamis.ai AI if that sounds interesting to you because again prices are
increasing after this weekend as well and you lock in your price for life. So yeah and come be a part of that that
half-day workshop too. It's going to be exciting. So all right we have our brief created
from our analyst. So I'm going to actually go back. Sorry I'm jumping around a little bit here. I'm going to go back in. Let's take a look at this
brief really quickly that we've created. All right. U someone mentioned knowledge
graphs. Knowledge graphs is another thing that we want to integrate by the way into BMAD.
Um, here I need to sorry I forgot to remove There we go. I forgot to remove that comment.
Plus one for Dynamus, not just because of Cole, but everyone in the community. I appreciate that, Sean. Appreciate that a lot. Enjoy Dynamus as well. Thank you.
What is happening in the community is really crazy. Thank you, Toby. I appreciate it, guys. Yeah, I I just like
I have to call out Dynamus a couple of times throughout this stream because it is where a lot of big things are happening. Um even like with Archon and
everything else around building agents and context engineering, but yeah. Okay, so here we go. We got our document
created. It's untitled probably just because um Mary didn't really understand exactly how to create the document in
Archon. I mean, it's just, you know, the little things that we're working through still. But here we go. We got next steps. We've got a risk assessment. And
so again like all the like genius things that the guy behind BMAD uh created like all the research he's done around
prompting and project management providing the right context like we see that in the different sections that we
have here. We've got our objective goal. Um we got our project overview the scope
requirements and uh if I scroll down a bit more I'm curious if I can get to the things where
it's like more specific to the research I did with claude code. Uh, okay. So,
technical specifications. Let's see if this gets into it more. Uh, okay. We got our tech stack. This looks pretty good.
Real time with sockets. Next.js. Um, nice. Looks good.
Um, okay. Direct SDK integration using TypeScript Python wrappers. I don't
actually like that. I don't want Python wrappers. So that's another thing I'll say in general with context engineering is like it's so important to validate
the output that you have uh from these kinds of um sub aents just any coding
assistant in general they they'll hallucinate weird things like this and so I'm actually going to go back into
our analyst here and I'll say I don't want a Python wrapper for anything.
Also, I need you to write out some more pseudo code.
Uh, do some more research on integrating
Cloud Code SDK with a Nex.js backend. Search the
Claude code docs some more for this. Okay. So, I'm going to have it correct itself in a couple of ways here. So you
guys are seeing live how I'm like looking through something finding those those code smells or like the doc
smells. I'm like that is bad. Like I I if I'm using Nex.js, it can be my front end and my back end. I don't need Python
wrappers for anything. So clearly it got confused just as it was searching through the docs, but that's okay. So
yeah, it's going through and it's it's performing rag and searching through the code examples again. So we'll see what
kind of token or what kind of output we're getting here. U okay so this is actually what I wanted because now the
main thing that I needed to understand is this import right here is actually super crucial because we need to
leverage this query in order to call into cloud code from our Nex.js JS
backend and I'll show you guys specifically the docs that it is referencing
is uh I'm talking about this or not where is it this thing right here. So
import query from cloud code and then like here's like a super basic example of how you can call cloud code within
your typescript code. So like this would be within our API endpoint in nex.js. So like this is what it just found when it
searched through using the knowledge that we have crawled with archon. So that's really good. That's exactly what we wanted it to find. So now we can use
that. And it's just wrapping up here. So I'll let it wrap up. And it it also did
a web search here just to like supplement his information. Which by the way, Archon doesn't have to fully
replace the web search that most coding assistants have. Like you can use these things together. Like I I love seeing it
when it performs some queries like looking at code examples and performing rag and then it also does a web search and it combines all that together. Um,
so yeah, we'll see that. And then it's going to update the Archon project. So it'll go ahead and update the brief that
we have in the UI as well. All right. Oh, another nice comment from
Kosik. I appreciate this, Koshik. The most important part of Dynamus is how engaged Cole and the founders are. Yeah,
I'm in Dynamus day in and day out. Like, I live and breathe Dynamus, just like we're living and breathing in the the terminal for this live stream here. So,
yeah. All right. Um, it's taking a while here, so I'm going to go through some other things in the chat. Oh, we got a
donation from Kooie. I did not want I almost missed this. I'm so sorry. Thank you, Kooie, for your support. Great demo today. Also, thank Sean for building
this amazing Archon UI. Hope Archon keeps progressing and thriving in the near future. Thank you, Kooby. I
appreciate that a lot. Um, yeah, Shawn is killing it for sure. Um,
I kind of want to shrink. Okay, I'm shrinking the message here. So, if I display another message, Mary is living
in 2016. Did she do a web search that was like 2016 or something? Or are you just
saying that like her output is 2016? Um, oh, thanks, Glenn. If you want to
help shape Archon Dinos community is the place to be indeed. I appreciate it.
All right. Um, okay. Oh, yeah. Yeah. Okay. Here's the question on on the knowledge graphs that
I saw earlier. Congratulations, Cole. Since you profess knowledge graphs so much, does Archon implement knowledge
graphs from more deterministic rag with frameworks like graffiti? So, really good question. I've been experimenting
with knowledge graphs for oh, I did a lot of that in the crawl for AI rag MCP
server. So, if you guys have been following my channel for the last couple of months, a lot of the things that I built into Archon, the different rag
strategies that we have with reranking and agentic rag and hybrid search, I implemented a lot of those things in the
crawl for AI rag MCP server first and that was kind of like a test bed for
some of the things that I brought into Archon. So, even some other things I've been doing on my channel, it is all for
Archon in the end, just showcasing it through separate projects so I could break things up more. Still have really
cool content to bring you guys and like show more like rag strategies behind the scenes, but with the end goal of it
being like, let's build this into archon and knowledge graphs is one of the things that I did some experimentation
with in the crawl for AI rag MCP. And we're already talking like me, Sean and Raasmus and and some people in Dynamus,
we're talking about knowledge graphs with Archon and already thinking through what that might look like. And Sean even
has a user interface for knowledge graphs already that he has just in like his own development environment. So it's
not like something that you could try yet because it's not ready, but we're thinking about it. So knowledge graphs, yes, that is going to be a part of
Archon at some point for sure. So yeah. Um,
can archon work with open router? So, I covered this earlier. Open router doesn't have embedding models, but we do want to make it at some point where you
can set your LLM and embedding provider separately. So, you could use like archon for the LLM and Gemini for your
embeddings, for example. So, yeah, we definitely have that top of mind. Um, so let's see. I wanted to look. Okay, so we
got a bit of like pseudo code here. So, this is what I was looking for. Like I I
wanted Mary to to not just like do like high level stuff but do like a little bit of like low like let's get the code
as well. So I'm looking at this. This is actually more than I wanted but it's all good. Um cuz I don't I don't know if she
updated the brief in archon because I don't see the tool call for that but like this looks pretty good overall.
Um okay nice. Okay, so now I want to make sure
she adds she updates the brief in Archon. So, let me scroll all the way back down. Uh, did you update the brief
in Archon? Make sure you do so. Okay, because I need I need to see that. Like, I don't just want the output here. I
needed to update the brief. And this is a a good example where um Okay, this sucks. I'll come to this in a second.
This is a good example where um there's definitely an opportunity to customize the prompting and the global rules to
make archon integrate more closely with BMAD. Like the analyst here, Mary, she didn't quite understand that like oh I
have to go back in and update Archon. I mean she apparently she said she did but she didn't which is super weird. Like
that seems like a problem in the prompting somewhere. But like yeah there's definitely an opportunity to have like a like BMAD specific set of
prompts where it's like for the analyst this is how you work with Archon. for the PM. This is how you work with Archon. Like that's kind of going back
to what Maxim said earlier. Like that's the goal that one of the goals I have for Archon is making it so that like there's a preconfigured setup to work
with these different strategies. Um kind of sucks that I'm getting an API error from Anthrop. So Anthropic is having
some issues right now. This is not this is nothing on my end. A 500 error is unfortunately an outage from Anthropic
which they they're saying their systems are operational. Um, but usually there's
some delay between like them admitting there's an outage and the status
actually getting updated. So, let's see. I'm just going to have to like retry this a couple of times and hopefully
it'll start working. Um, me.
Okay, it's retrying. Well, anyway, while it's doing that, that's okay. Cloud code
is amazing. It is such a cool tool. works so well. It's better than every coding assistant. But man, do these
errors just crush me sometimes when I'm in the middle of something really important like I am right now doing this
live stream with you guys. Of course, I get API errors and Anthropic has an outage when I'm doing something with you
guys, but hopefully this will be temporary. When I was doing some playing around with BMAD this morning, I got this as well and it went away um pretty
quickly. So, it only is like 10 minutes of an outage. So, I'm just going to head to the chat here and just use this as a
time to talk to you guys. So, yeah, let's see.
Um, can Archon crawl docs with Sphinx standard? I'm not actually familiar with
the Sphinx standard, so I'm not sure. Um, yeah, I'm sure that's a really good question, but I actually am not familiar
with that. Um, do you run Archon on a dedicated server or locally? So, Archon right now,
it's only possible to run it locally. It's just meant to be something that you pull the GitHub repository, you spin up the containers yourself, and you run it
locally. Which means you can actually have everything entirely private. Like, you can use O Lama for your local LLM.
You can use a self-hosted superbase. You can run Archon completely local. And if
you want to take it really far and use like R code with a local LLM, for example, you can have your entire coding
environment with Archon 100% local. Nothing ever leaves your computer. No, you you're never sending data out, I
should say. So, yeah. Um, it's pretty sweet.
Um, let's see. I'm trying to have you addressed the question of GBTOSS if it can be embedded. So, you can use GPT OSS
through Olama and Archon with uh Olama being something that it's not fully
supported yet, but we're working on that. and then you'll be able to use open source models for sure.
Um, yeah, this sucks. I really hope that this doesn't last for too much longer. I
mean, it's nice to like have a time um to like chat with you guys, but I was hoping to mostly be chatting with you
guys while things are actually running and not just getting outages. So, that kind of sucks. I'm going to check the
status page as well. Okay, so nothing nothing yet. Uh, we'll see if we get an
update here. So yeah, no incidents, but obviously there is one. Mike said that
also Anthropic is choking here also. Yeah.
Uh that's Yeah, that's too bad. Start with the courses. I assume you're talking about Dynamus. Yeah. So if you
guys don't know in the Dynamus community, I have a full course going start to finish building AI agents from
scratch and I walk through my entire process for doing so with a ton of different templates that you guys can implement like right away. It's pretty
sweet. Um and and I'm actually in progress making that course. I just finished module seven out of 10. So I've
been working my butt off on that course, putting a lot into that. So yet another part that um that I have in the
community for you guys. If it doesn't help slashcle and slashexit will resume. Is this for
the outage are you saying? I mean I I don't really want to restart my session here because um I will lose all the
context I've been building up with the analyst already. So, I don't know if I maybe you were talking to someone else,
though. It's kind of hard to follow the chat fully. Um, okay. I'll go to the next thing from Tim here. Read global
rules. I'm creating a project that uses langraph, padantic, mem, and neoforj. That's awesome. Should I only include
base archon plus langraph for the global rules and nothing for the other primary libraries?
So, that's a really good question, Tim. It is up to you entirely. You don't have to specify a ton of things for the for
each library that you're using in the global rules. Like generally, you will have your global rules for archon.
You'll have your general global rules for like Python, for example. Like here are the the key things like architecture
and best practices I want you to follow for Python. And then if you want something specific to langraph like
whatever your like really like core tool is for the implementation sometimes you'll have global rules specific to
that but for all of your like more supplemental libraries I would say like mem zero for example you definitely
don't have to overengineer global rules and include a lot for that as well um you just using archon to retrieve the
documentation for me zero and pantic so like understands how to use those
libraries and like looking at the examples there That's generally enough. So I I wouldn't try to like fit everything into your global rules. Like
allow archon to like find that for your coding assistant as it's doing some
searching with rag. But yeah, good question. Let's see what else we got. Are you
working at So I'm not doing TDD right here. Um though, yeah, I don't think
BMAD doesn't really do test driven development. I don't think like but like definitely TDD is powerful with coding
assistance like they work quite well if you build the tests first and then have the code after that. Um not something
I'm doing right now though. Let's see. Uh switch to Gemini CLI or
Crush. Yeah, I don't I already have the context here and I don't actually have
Gemini CLI installed in this computer. I was testing out elsewhere so I can't really do that. um pretty reliant on
Claude code for this live stream and be hard to like switch things over. So, let's just hope that the outage doesn't
last long, but it's okay because we got a time for Q&A right now. That's all good. And I maybe I'll poke around and
show some things in the Archon UI while we wait for this retrying in 40 seconds. This sucks. Um I'm curious, is anyone
else actually getting things to work with Claude right now? because it maybe
it like because I know Mike you said it's not working for you but maybe it's like a geographical outage or maybe it's
not like a full outage. Um I don't know. This is really unfortunate though. But it's all good because we adapt. We're
freestyling in this live stream to the point where we can't even code anything but we're going to make it work anyway.
Um yeah, this is why I run cloud code through open router. Yep, that's fair.
But I think Cloud Code is updating things where you can't use proxies anymore to go through models um besides
Claude. I think they're actually taking that away. That's what I heard at least, which should be kind of unfortunate, but
BMAD version 4 includes TTD. Okay, that's really cool. That's good to know. I didn't actually know that.
Okay, Claude is working for you. Okay, well, let me try this. I'm gonna
try a new Claude session and I'm going to see if I just like say hi if it's going to work because maybe maybe I just
need maybe I do need to restart my session which would be unfortunate. I guess it's not that bad though cuz I can re Oh, it is working. Wow. Okay. Um
stop. That's unfortunate. So somehow it's like
my just my session. What? Okay, that's too bad. Um, that's really too bad cuz
it's it's just going to be kind of annoying to like restart a new session and then uh give it this context again.
So, all right. Well, we're going to bite the bullet and we're going to do it. So, I'm going to go into
um emad app clear. We're going to we're going to do this from scratch. So, I'm going to say analyst and we'll see if we
get an error here. Um oh, I can do a resume. Right. Right.
Resume. Um,
wait, that didn't work. Hold on. Why is that not working for me? I might
just do a new session here. I'm going to do Okay, I'm going to tell Mary to grab the project brief from the And then I
need to know the name of my project here.
It's the Yeah, this one right here. So,
all right. Grab Well, this is also kind of cool to demo like uh just like
pulling in the brief and starting from scratch. So, I'm having it grab the project brief from this project in Archon and then do some more technical
research looking at the um cloud code documentation to see how to invoke it
from TS and then add onto the brief in Archon with your findings.
So, we have a more technical component. I'm not spelling things right, but that's okay. Have a more technical component for the brief. Okay, so I'm
going to go ahead and send this in. Hopefully, we don't get any more errors. Um,
Claude, I could do claude d-resme. Okay, well, I'll just try this here. Claude
dash resume. Is that what you meant? Like I exit out? I mean, I lost the session, but
oh, wait, hold on. Shoot. Okay. Um,
use archon for rag. Okay. So, trying to do a web search, which I just want to start I just want to have it start with
archon. So, I'm going to tell it to use archon, but uh yeah, let me claw d-res.
Okay. Can I start from my session from two minutes ago?
No, it's like it's just broken now because it it's stuck here. It Yeah, I'm just going to close out of this. We
we'll we'll go to this session now because apparently it's just working, which is weird, but okay, we're resuming. We're good. We're good. All
right, we got a donation from Paul. Thank you, Paul, for the donation. I appreciate it a lot. Uh, and yeah, we
can go through a couple things as it's working here. Would it be possible to ingest my complete cursor chat history for a project I've been working on for
four months? If so, would the information be useful in providing the cursor agent with memory?
That's a good question. So, that might be that might be too much information.
Now, with the if you actually are storing this in a vector database or a knowledge graph, you can scale to quite
a bit of information that you have stored. I don't know how useful it would be though. Um,
here's what I'll say. Generally, when you're using AI coding assistance, I've
never done it before. I haven't really heard of people having success with just taking the entire chat history and
dumping that in like long-term memory for agents. Usually, more what you'll do is you'll get to certain checkpoints in
your implementation, your codebase, and you'll have your coding assistant output a summary of what it did. And so you'll
have like a set of markdown documents that just outline like here's the feature I implemented or like here's the
story that I completed and here's a summary of what I did with maybe like a little bit of pseudo code or like
referencing the files that were changed that kind of thing. And so then you have something much more compact where you
have a set of information that's like all just like pure value versus a conversation history will get pretty
messy because you're going to have a lot of like going back and forth with the coding assistant fixing different things. And so also in the long-term
memory if you pull a certain chunk like through rag it might actually be pulling an implementation or like a part of the
conversation where things were actually broken and that that's kind of dangerous. So, I would more like get to
certain checkpoints with like stories or tasks being completed. Have it output markdown documents for what it did. Now,
that's where you could build up more long-term memory of like here's like the change log basically like here's what
happened when I started the project and what I implemented. Now, here's what I changed as I'm going through an existing project. And that would I think make
better long-term memory. And I know that like that's not really
something you can do retroactively. you kind of have to like have that as your process going forward. But that's definitely what I'd recommend doing.
But yeah, okay, there we go. So, we have now updated our brief. So, we did a bunch of searching here. Now, we've
updated our brief in Archon with some more technical implementation. So, let's actually go back into Archon. Let's
check this out. So, I'm going to refresh, go into docs. Oh, this is the wrong
project. Here we go. All right. We got a title now, by the way. That's good. So she Mary fixed things with version 1.1
to actually add a title and cool. She even labeled herself. This is cool. So this is this is another neat integration. Something that that another
big thing I know that I'm talking a lot about like the vision of Archon here um as well as showing it, but I think that's important. Another big thing we
want to do in Archon is make it integrate really really deeply with the idea of sub agents. And so different
documents can be labeled by the agent that created them. different tasks can be assigned to different agents like we
can have Mary tasked with the um the research and the like initial like kind
of like all the analyst stuff right like we're creating our uh brief here and then have like the project manager
tasked with the things that we have related to creating the PRD having the developer tasked with things related to
the coding and the QA agent like we can have these different tasks that are assigned to different things that we
have in our task list here and then have them all coordinate together and so we have like clear boundaries in which sub
aents are implementing what things based on their assignment in archon. That's another thing that we're looking to do
as well. So here's Mary has added version 1.1 for the brief. So we have a
lot of the same things as before like our scope requirements and our text stack and resource requirements but then
we should also have more of a technical implementation. Um, like here for example, we got some
actual like code in here. And I don't I'm not gonna like go through and like validate all this right now because I I
do want to move forward, but like we have some more like technical pieces to our implementation now. Um, so I think
that's a good starting point. We'll kind of go with that. Um, like talking about the context manager pattern, like things
that are specific from the cloud code docs that have it found. So that's really good that we have that now and we used archon to fetch those things
because who knows if a web search would have been able to get something that specific. And um also it's just nice
that like we can pull code examples and things from Archon as well. So, okay, there we go.
Uh another donation. Thank you, Christian. I appreciate it a lot. Your sharing spirit is so highly appreciated.
Keep it up. Thank you very much, man. It means a lot. Um
oh, sorry, I meant to showcase the other thing here. Can I Thank you as well for the donation. Daily profit. Can I create
the same for the Python ecosystem? Yeah, so um actually I mostly work in Python.
I'm just doing this right now because I think Nex.js is the simplest for what I'm looking to create here, the front end and the back end, but I typically
work with Python. And so I'm I'm using Archon for Python all the time. And all my context engineering, a lot of the PRP
templates that I've created for things like Pantic AI, they're all Python. And so Archon is not specific to a language
or a coding assistant. It is general enough to apply if it's you're working in client on something with TypeScript
or you're working in Kirao with something on Python or you're working in cloud code with a Rust application, right? Like it applies to everything.
You just crawl the documentation for the libraries you want to use no matter your library or coding assistant and then the
way that you manage tasks is the same for any language or coding assistant. So yeah,
doing a great job, Cole. Really, really appreciate your efforts. Thank you very much. I that means a lot. Yeah, and I'm seeing a like sorry I can't like
showcase all of the the comments that we've got here um in the chat, but but uh I'm I'm seeing them. So, thank you
guys for all the kind words. Like, it really means a lot. Okay, so we'll go ahead and um
move on to the next thing here. So, we have our brief created now. And so,
actually what the founder of BMAD recommends doing is clearing the conversation entirely when we go on to
the next agent. So, we've been working with the analyst agent this entire time. Now, it is time to move on to the
project manager. So, I do PM uh /pm and then tab. So, I'm now invoking the
project manager because essentially what we want to do now is we want to take the brief that we've created in Archon based
on all the research we've done and everything. And we want to turn it into a PRD. So, it's going to be more
specifically like let's dive into the specs for what we want to have created. So, now we have John, our project
manager. And it's actually pretty cool because I invoked John and right away he goes into
the existing project that we have for Archon. That's pretty cool. So we have uh no tasks yet, but yeah, that's right.
Like right now we just have the doc in the project. So I can do star help to see what we can do with our project
manager. Now the thing that I want to do is create a PRD.
Um so yeah, let's go ahead and I'm going to copy the command here. So specifically what we want to do is we
want to create a PRD. And I I promised that I would talk about working with brownfield projects as well. So we're
creating something from scratch here. But if you're working in an existing codebase, like I said, the big
difference is with existing code bases, generally you're going to be more referencing existing code versus with a
new project, you're looking to external documentation for things like architecture and best practices. And so
there are actually different commands that we invoke in John our project manager in BMAD based on if it's a new
project. This is for a new project. This is for an existing project. Like if we're creating a PRD to add a new
feature into an existing codebase. And so I won't showcase this right now, but yeah, the diagrams that we have for
BMAD, if I go back to that here, there is a different step that we take based
on if it is a new project or an existing one. We're kind of at this stage in our diagram now. So, I'm going to paste in
my command here. Uh, whoops, I did not mean to do that. Let me copy the other thing that I have uh just from my notes
here, my other monitor. Okay, this is what I meant to do. So, we're going to call the create PRD command. And I'm
telling it to pull the brief that I have in the archon project. And then I want it to create the PRD in archon as well.
So, we'll have a second document after we invoke this command. And also the big risk that I have to tell you guys with
claude in general and with BMAD is it oftentimes loves to overengineer.
And I'll show you guys what it looked like. This this is really unfortunate. The other example that I showed you guys. So like this project that I had
created to like play around with BMAD initially, it created 123 to-dos. it
completely overengineered with like super random tasks and things like this is the risk that you have when you have
Mary and John working together to create your initial PRD. Like things just get
so overly complex because it's trying to build like this full productionready software for you and you don't need that
to get started. It's way too much to to go through in in one time at one time. So yeah, I would say like my biggest tip
is in your global rules for your coding assistant and just generally in your prompting. It's important to be clear
quite often that you want things to be simple because Claude loves to overengineer. It's so annoying. You we
don't want 123 tasks. We want like 10 to 20. Like that's what I'm hoping to create here. And so I'm telling it to
not overengineer and just keep things simple. And so first we'll see it call into archon. So it'll use the MCP to
grab the brief. Uh there we go. So, we pulled the brief. I can do control R to
expand it. We can see it. It pulled the brief here. And then it's going to uh do
some research. I I forget exactly what the project manager does to like create the um to create the PRD. Like I forget
if it does research or if it more just like takes this and transforms it into a a PRD like just with its own reasoning.
But we'll see in a second. This will obviously go for a little bit though because um or no, I guess it wait I
guess it's almost done. Here's our simple PRD. Okay. Product vision core
problem. Here's our solution. A lightweight Nex.js app that wraps cloud code SDK to enable multi-instance
management. This that's perfect. That is a oneliner for exactly what I want to create here. So it's good. It understands what I'm looking for. And
then here's our MVP. Here are things that are out of scope. So it's avoiding complexity. I actually love this a lot.
So when I was playing with BMAD initially, it was like including like all of these things like I actually
remember seeing this explicitly that it was like trying to implement like team features so we could have multiple people managing this this whole like
application which that's cool but like let's not try to implement that right now. It's good that we're excluding some
of these things. So we're starting with a simple local app like we have with Archon. Then we can build these things
after which by the way that is actually what we're doing for archon like in scope what we built for the beta of
archon is let's give a simple and beautiful user interface to manage
projects knowledge and documents. Then when we start to move out of beta and
get a lot of feedback for how we can improve the platform. Then we'll start to add in different context engineering strategies and being able to manage the
full suite of context and let's get into enterprise f features and make it so you can host archon like that. Those are all
the things that are coming for archon. But we not we got to start simple because if you try to do too much at
once like coding assistants like to do, you are just in for a world of hurt. And so we're starting simple. I I actually
appreciate this a lot. So let me go back down. Okay. So, uh, yeah, out of scope. Here's
our simple architecture. I mean, I kind of wish it expanded on this a little bit more at least, but that's okay because I actually love it
when coding assistants will output like the code base, like the structure that they're they're looking to implement.
But yeah, here is our text stack. Xterm for terminal display. Sounds good to me. Next.js14 Tailwind looks good. Um, no
need for Okay, so it's just going to do local storage for the config. So, we're not even using a database, which I think that's fine. I guess for this
implementation, we'll call it good. Uh maybe it's actually a little too simple, but I think for the cases of our live
stream here, because we're already at one and a half hours, this is probably this is probably good.
So, yeah. All right. Um let me go to success criteria development principles.
Good. Good. User journey. Okay. Now, now we create this document in uh Arcom. So,
cool. All right. So, let's actually take a look and make sure this was created, that it's looking good. So, I'll go to
my projects. I'll go to this one that we have new here. Go to docs. And there we
go. Here is our PRD. Nice. Cloud code instance manager simplified PRD.
And um yeah, looks like there's a couple of little issues here. Like I said, the docs part of Archon is like the most
experimental right now. And so, it's expected to not like look the perfect right now. There actually is a PR out
from Sean to improve a lot of these things. So, we got we got improvements coming for this like really really soon.
Um but yeah, um this is looking really good though. We got our text stack folder structure. Here's our scope
looking really good. Like perfect. All right, we got our PRD. Like now we're ready to dive into the implementation.
Um yeah, like this is this is great. I love how it looks overall, even though it's not like perfect yet. And then
there's also a markdown editor if you want to edit things yourself, you can do so. So you can be a part of the process of editing the doc right in archon and
then saving it to your superbase. So like all these documents are stored in superbase so you can reference them between sessions even between users very
easily. Like one thing that us like core maintainers for archon like everyone in the Dynamis community what we're looking
to do is actually like spin up a shared archon instance which it doesn't
actually mean like here here's the cool thing with archon. If you guys want to share your Archon instance with other
people because everything is stored in Superbase, it's not like you have to host one Archon instance and then deploy
it to the cloud. Like you can have everyone running their own Archon instances locally just pointing to the
same Superbase database that you have in the cloud. And so obviously that wouldn't work for like localhosted
Superbase. But if you're going to like superbase.com and creating a project there, then everyone can can use the
same archon instance. So you can have everyone working on the same projects and docs. They're just all running their
own archon pointing to the super basease in the cloud. It's pretty cool. So yeah. All right. We got our PRD now. And then
there are quite a few other things that we can do with John the project manager.
And so I'm going through things pretty quick. Like there's a lot of other things we can do with Mary the analyst as well, but I I don't want to spend a
good amount of time on each of these. I want to get through things pretty concisely, but typically when you go through
using the BMAD method, you'll spend a good amount of time with these different commands and actually providing your own
feedback a lot more. like I'm doing things the way that I am now just to keep it concise. But typically, you'll
spend a good amount of time working through these different agents because the context that you provide up front is
so important. It might feel like it's taking you a long time, but it's important to sharpen your axe because if
you try to rush through this initial planning and creating the brief in PRP or PRD, I should say, if you rush
through that, then the actual implementation is going to take exponentially longer because it doesn't understand what you're looking for and
it's going to hallucinate a lot more because it didn't do that upfront research. And so, it's worth spending time with this.
And so in this case, what I'm going to do with the project manager,
um, is I think I'm going to call it there. I'm looking at my notes here to see what else I did. Um,
yeah, I think I'm going to call it here. So, I'm going to I'm going to clear and I'm going to go on to the next agent
here. So, going to our flow within BMAD.
Let's go back. So, next up, we have our architect. So, we're going to create uh
the architecture from the PRD. And also, I'm going to actually have the architect create tasks for us in Archon. So, I'll
do slash architect. Good. Good. And I'll do the help command after it runs its little intro message
for me here. Um or I guess it's going right away. Wait, what is it doing? I'll help you
set up the Archon project management system for a BMAT app. Let me start by checking what's available in the Archon MCP and create a project structure. Um,
all right. It's just going right away. This is interesting. I'm just going to let it run. Like I said, we're freestyling today. When I tested the
architect before, it didn't do this, but now it's just like running right away. Um, and it's okay. So, now now we're
integrating BMAD with PRP. Let's go. Okay, this is interesting. I'm I'm just
going to see what it does. Um, what is it doing?
Okay, I need to stop it now. Sorry. Sorry. Sorry. Uh, architect. What's the
architect's name? The architect didn't even tell me what its name is. It just went right into it. Uh, what is your
name? All right, cuz it c the thing that I made me have to stop it is that it
created a third project and that's that's not good. Like I needed to I'm going to just go ahead and delete this
project because I need it to reference the existing one because we got our docs here. So, but that's all good. Like it's
fine just to correct it quick. Okay, so it's Winston. So Winston dove in right away before even introducing himself to
me. Okay. Okay, Winston, I need you to use the existing project in Archon and
then I'll just call out the name. Uh so let me go back here. I'll copy
this because I I just don't want to reference the old one that I had just to like show you guys a previous attempt. So um yeah. Okay. Okay. So using this
project read the PRD that we have stored in that project in Archon.
Then I want you to shard the PRD into tasks
uh no more than 20 tasks and put those in the tasks for the archon project. All
right. So basically what I'm telling it to do is pull down this document right here. And then based on all the
requirements that we have and everything, I want it to just create 20 tasks. So we start building up our cananban board here. So we can dive into
the implementation. And so I don't know if 20 is enough or not. I just want to like really keep it simple here. And so
yeah, so it's pulling the document here. And now we're starting to create some tasks. And so we should be able to see
this pop up in real time as we go. So let's see what it's doing here. I'm going to go ahead and refresh.
Um, okay, there we go. All right. So, it's creating some tasks there. I got to Sorry, I'm having an
issue with my browser here. Um, okay. Yeah, there we go. So, it's creating some tasks here. Like, let's
see this one right here. Create cloud SDK wrapper class with TypeScript. Looks good. And it's referencing the specific
file to implement. It's talking about error handling with some like specific errors that so like this class the CLI
not found error like it found this from the cloud code documentation. So this is based on its research that it did with
the archon arg functionality that we gave it. So yeah it's looking good. So it's going through it's creating all
these tasks here and um yeah I'll just kind of let it run with that. So I'll go
to the chat here while we got the the tasks being created in Archon.
Um, Winston is defin on the chopping block. Yeah, come on, Winston. No, it's
all good. Um, because like I said, there's probably a lot of opportunities to integrate BMAD with Archon a lot more
with like just even the way we're setting up the global rules, telling Winston how to use Archon. So, it
doesn't make those assumptions like he did in in um initially, which yeah, so I don't really blame him, but it was
funny. So yeah, LLMs and and sub aents, they're they're inconsistent in the way that they leverage the tools that we
give them. And so that's why it's really important to be super specific with our prompts.
Um Cole, nor Okay. Yeah, good question, Toby. Normally use cloud code in the WSL terminal. Reason why you use cloud code
in Windows when you're using the BMAD method. So this Yeah, really good question. Um
I this is not specific to BMAD. I've had some issues recently where if I use
cloud code within WSL specifically, it doesn't matter if or if I use cloud code
in a um IDE terminal specifically like a VS Code terminal, it keeps freezing on me.
Like it's super laggy and glitchy and whether I'm using WSL or not, just like within a terminal in um the IDE. And so
I've started to just use it within just a Windows PowerShell on my computer and it's it's performing a lot better. And
it things were slow in WSL especially for some reason running unit tests with Piest was like super slow in WSL and and
even just like installing my pip requirements was a lot slower in WSL than it was um just outside like on my
Windows machine. So yeah um I don't know why it that's the
case but it's things are just faster when I run it here. So, it's not specific to be mad, but yeah. All right. Donation from Kev.
I appreciate a lot, Kev. Thank you very much. Would deploying to a home server just be a matter of reconfiguring
the&env and docker compos to allow ports and URLs to be accessible remotely? I mean, aside from host type pricks.
Really good question. So, we actually have someone in the Dynamis community. Uh, his name is John. He has It's so
cool. He's running nine Olama instances on the computers that he has in his house and he's doing a ton of different
like testing for embedding models and LLMs with Archon. He's the one that's actually working on the PR to like
really get things ready for Olama for Archon. And so he has um Promox is I
forget the the name of that that service, but he has it. So like he has an IP address for his machine like Olam
on his machine that he's pointing to with Archon hosted somewhere else and and so you can configure the ports and
everything for Archon in thev. So I'll actually go if you go to the bottom of
the readme for Archon, which by the way, remember if you just go to archon.diy, boom, there you go. It takes you right
to the repo. We have instructions for installing it here. But yeah, if you scroll down, we have um configuring
custom ports and host name. So we got some instructions for that. And so you can do like a specific IP address if you
have that like hosted with firewalls open for your machine. Um my home server is on a separate LAN
not accessible to the internet. I access it via Twin Gate. I think that should work. Now I haven't done a lot of that
myself. So, uh, John in the Dynamis community, he would be the one to, uh, talk to about that because he's he would
know a lot better than me. Um, yeah. So, like I think he's going to be active in
the GitHub discussions and things. So, yeah, I guess that's the other thing I forgot to call out. So, I hope that helps, Kevin. Like, it should be
possible, but you I would just read the config down here to get you started and then if you have more questions, like
John would be the one to talk to for that. So the other thing I wanted to say is the community forum that we have for
for Archon is going to be just right here in the GitHub discussions. And so it's just going to be it's it's really
nice like having things in the GitHub discussions. Um so that we have it in the same place where I can like
reference issues and PRs and things. So, aside from like Dynamus, the place to go deeper, if like you really want to be a
part of the vision of Archon, this is just the place for the public forum, which I will say again, if you guys
really want to dive deep into using Archon and being a part of the vision and contributing, like definitely check
out dynamis.ai because like we got we got some things happening here. And like I said, just like a whole another level
of energy for all of the initiatives that we have in the community for archon and context engineering. And uh like I
said earlier, I just got to pull this up again because like I'm going to be putting so much effort into this. We've
got the full half-day workshop, my full AI development workflow that I've got on August the 27th at the end of this month
here. So, a lot of what I am doing with you guys in this live stream is just freestyling and we're just playing
around with integrating BMAD with Archon kind of like for the first time. Like I haven't really done it before because like I said, I just want to show you
guys what it's like to really like do this from scratch. Like you're playing around with Archon for the first time,
just trying to figure out how you integrate it with your agent coding workflow. But like this is where I'll have a lot more structure showing you
everything that I do and how exactly I use Archon and context engineering and
providing just like a ton of resources for you guys to get started with like global rules and sub agents and PRP
templates based on what you want to build. Um, and that's actually another thing we're working on the community is
like a full context engineering hub of like different resources depending on your programming language and the project you want to build. So yeah,
definitely come be a part of this. Like I I said at the start of the live stream, but it's worth saying again like
just this workshop alone is worth the investment for the community. And that's the amount of I'm putting the effort in
to like say that's true and have confidence in that. So yeah, definitely check out dynamis.ai.
But uh yeah, let's go back to um I'll just refresh to make sure. Oh no, it was
already loaded here. So we got the 20 tasks for our project here. So it's starting all the way at the beginning
with initialize next.js14 JS14 with TypeScript and Tailwind.
Um, and then we get create API routes um for different things. Looks good. Build,
create the instance model form. Okay. All right. Good. Good. All the way to final testing and GitHub release
preparation, which maybe that's a little bit of overengineering, but yeah, within each of these tasks, we also have a description. So, we're giving more
context to whatever ends up implementing this, what exactly we're looking for. And here we're specifying things like
using externs. So it's very much referencing the plan that we have in our PRD. It's putting those things into the
descriptions here. Like we have our text stack being referenced throughout our tasks. And so everything is like very integrated here. That's the beauty of
it. And so now going back to my um architect here, there's a lot of other
things we can do. So, I'll kind of like continue with the common theme here of like I'm not going to be using
everything within these sub agents just to keep things concise, but I want to like show you guys some of the other things you can do with these different
sub aents with the BMAD method and probably some other things that could like integrate more with Archon as well.
So, our Winston is a devious little architect that didn't even introduce himself at first.
He can do a lot of other things. We can um do some more research if we wanted to. Like I could actually have him like
research best practices for architecture. Going back to Archon for the docs. We can have him create a
front-end architecture specifically, which if I had the time here, I probably would actually do this. I think that
would make sense because a lot of what I'm building here is relying on the front end being quite robust, especially
being able to like have terminal output for our different cloud code instances. Like definitely that would be important.
Um, however, to keep things concise, I'm going to clear. I'm going to say we're good here. We we got we got our tasks in
place. We've got our PRD. Like we have a scope of work. Um that's not the tab I
meant to show. I meant to go back to our con. So we got our tasks. We've got our PRD. Like we have all the context we
need to really start diving into the implementation. So our PRD plus our
tasks plus probably leveraging our knowledge base even more. Like that's everything that our development agent
now needs. And so there are some different agents within BMAD like we
have the dev agent. I could dive into using this. Uh we also have the
uh scrum master agent. If I wanted to invoke the scrum master agent, we could dive into these things. That's really
going to be that second part of the flow that we have in BMAD. So like we basically went through this whole
planning workflow and I know I skipped a lot of things but like we went through it and a lot of it is optional. And now
we've gotten to the point we're ready to go to the development workflow. And so we kind of go in a cycle here where we generate these stories based on our PRD.
I kind of did something a little bit differently in Archon where instead of stories, I more just have like the different tasks in our project. And so
now we can start knocking these off one by one. And in order to do this, I actually kind
of want to use PRP. Like I said, freestyling. I'm going to switch from BMAD to PRP. So we used BMAD
for the planning. And that's kind of equivalent to creating like our initial MD file where we're just describing
those initial requirements that we have to create our PRP. And so I'm going to do something kind of interesting here.
So within my uh VS Code, I'll I'll just pop this up quick. Within my VS Code,
the same place that I have BMAD set up, I also downloaded the um the starter for
PRP. So we have our two commands to execute and generate PRPS. I've got my
template to base a PRP off of. By the way, this is all available to you guys
in the context engineering intro repository that I've covered on my channel a couple of times. And so I'm
just pulling all of the like getting started stuff from this repository so we
can implement PRP because what I'm going to do is I'm going to take the spec the PRD that we generated with BMAD and I'm
going to turn that into a PRP so we can just start implementing it with all the tasks that we have in Archon as well. So
this might be a little bit of overengineering but I think this is cool to experiment with. So we're just going
to do it. We're going to go ahead and do it. So I'm going to do slashgenerate PRP
and then typically with PRPS you want to reference a file that has your initial
requirements but instead I'm going to say uh look at the or I'm going to say use the PRD we have in the archon
project and then I'm going to go back to archon because I got to copy that name again of the project here cloud code
instance manager Nex.js control center. There we go. So, copy this, paste it.
There we go. Okay. So, we're going to generate a PRP, which is going to it's going to take the PRD and turn it more
into a prompt for our coding assistant. So, we have things like validation gates, so it understands how to validate
its work. We're going to be more explicit with like the final codebase architecture that we want. And so, yeah,
I'm going to I'm going to let it run and do that. So, in the meantime, I will go ahead and
uh go to some comments that we got here. Uh, check out Ghosty. Super performant,
feature-rich environment, agnostic, modern terminal. Thank you for the donation and I appreciate the suggestion. I have actually heard some
good things about Ghosty for sure. So, yeah, I think it'd be cool to check out. There are so many cool tools that we can
check out for coding and context engineering and yeah, I have heard some good things about Ghosty. Is it is it
open source? I think it is. Um, because I thought I remember here, I'll have a GitHub.
Okay, they got a GitHub, so Oh, wow. Yeah, 34,000 stars. That's pretty awesome. MIT license. Good to see. Cool.
Yeah, know that's pretty sweet. I I've seen this. I haven't tried it myself, but I've seen it. And I know there's some people in the Dynamist community
that have tried it out and said good things about it, too. Which the Dynamist community is just the place where all
the ideas are shared. Like, it's pretty awesome. So, all right.
um would be nice if the community part was
open source on Discord or something. So yeah, when I talk about Dynamus, it's more like the place to dive deeper, but
we still have a free community just within the GitHub discussions here. So it this is a 100% public project. Like
don't get me wrong, we have the GitHub discussions and I'm going to be active here as well. So yeah, hope that helps.
I mean, this is kind of like the equivalent of a Discord. I just think this is going to work a lot better than Discord uh because it's easier for me to
manage and other maintainers because we're already in GitHub constantly with the issues and PRs and then within
individual posts it's easy for us to we can just reference issues and PRs when
things come up which I know there's a lot of um there's a lot there's definitely some bugs that we have to
work through right now but like I'm on top of it. We got maintainers. I've created I'm starting to create a full team around archon. Like there's a lot
of lessons that I've learned from other open source projects I've been a part of like bolt.diy where we didn't have extensive CI, we
didn't have GitHub discussions, we didn't have templates for issues and PRs initially and like I'm implementing all
those things and building a full team around it, even doing some hiring. So like like we're we're putting in the
work to make it so that Archon is a project that we're in for the long haul. So yeah.
Um Oh, that's pretty cool. Pretty much
ditch IDs with Ghosty in a three pane setup with cloud code integration. That's really cool. That is super cool.
Um, let's see. I guess I'll let me watch the terminal
here. Okay, so it's doing a web search as well. So, I'll I'll let it supplement the rag with web search. Might as well. I think I actually tell it to do so in
the global rules, actually. All right.
Let's see. So from Tim here regarding PRP templates, I saw a lang graph template uh separate panic AI template
in Dynamis. Is there an advantage to combining them all together into one overall template plus me0ero plus Neo4j?
Yeah. So uh Tim, I I I think this kind of goes back to your original question where I I wouldn't overengineer and try
to combine like a ton of different things together. I would focus on langraph
and then if you wanted to try to like use cloud code to combine lang graph with pantic AI together to create some
kind of global rule where it's like here are best practices and and strategies to like build langraph workflows with
pyantic AI agents you definitely could do so u but again I would just use like normal rag for like the mem zero neoforj
stuff and not try to like build a ton of that into the global rules be more like describing the core of your stack and
the architecture for that with like lane graph and pantic AI. So I would encourage you I'd actually love to see
it if you take those templates that we have in the context engineering hub and dynamis and you try to like combine it together. So it's like let's build with
pantic AI and lane graph and integrate them really closely like I do with module 7 in the course. Um definitely
like feel free to do that. I' I'd love to see it.
So yeah, great stuff man. I appreciate it very much. Um, great work on Archon.
Wait, hold on one second. Uh, why is it doing so much web search?
Oh, it's because well, yeah, duh. It's because we don't have Xterm pulled in the docs for
Oh, okay. This makes sense. Okay, this makes so much sense. So, I realized what's happening here. So, like for the
so the MCP server for Archon, there is a tool where we can actually ask it like
what sources do we have available? Like in my claw code, I have archon connected to claw desktop by the way. So I can say
like what sources do I have in Archon? So our coding assistant can actually
determine what what am I able to perform rag on within Archon. And so we'll see
in a second here. I'm just waiting for this to get back to me. Um
well here I'll just uh take that out in the meantime. So it'll it'll list out the sources that it has. I have no idea why Claude desktop is freezing on me
here. and and it'll tell me like you've got clawed code, you've got the nex.js
docs, that's what you have available to you. Um you don't have like the
websocket stuff, you don't have the exterm stuff. So it knows it has to do web searching for that because it wasn't
able to find that information when it was searching through rag and archon. So that's that's kind of another thing I
wanted to call out there. Um, I need to let me So, claw desktop sometimes it
freezes on me or like like it disconnects from the MCP and I have to reconnect it when I restart. Um, that's
another really good thing to know is when you restart Archon, you also have to restart the MCP client. So, I have to reconnect. So, now if I I should be able
to ask this question. It shouldn't freeze again because it it makes a new connection to the MCP
now. It should work otherwise. Yeah, here we go. All right. There we go. There we go. So, here are the four sources I have in Archon. I got panici,
cloud code, mem zero, and nex.js. It's perfect. Cool. And really neat as well,
you can you don't have to use archon with coding assistance. Like I can ask it questions about um I can ask it
questions about cloud code right here in cloud desktop. Like I can say, how do I call claude code with the
claude code SDK in Typescript? and it'll go and it'll perform rag just
like our coding assistant was doing but now it's just more of like a chat like we're not trying to implement anything maybe we're just doing some highle
planning right now and some architecture and so it's performing some rag queries and searching some code examples just
like we did in cloud code but now it's just within our chat it's pretty neat so
it's going to do a couple of queries here I have it prompted in a way like the tool descriptions for archon where
it'll like do follow-up queries to really refine its answer so here we go let's get our our information. Okay, if
we do the mpm install, here's our basic usage. And if you guys remember from earlier using that query that we import
from cloud code, this is like exactly right. So it it found probably both in the rag query and the code example
search the exact part of the documentation that I wanted it to find. Like I pull this up right here, like it
found um let me just reference it again. Like it found this exact thing. Like
this is what it outputed right here or pretty close at least. maybe adapted the example a tiny bit, but like yeah,
perfect. There we go. So, okay. So, now it's creating a comprehensive PRP. So,
it's going to take a while because PRPs are longer. So, in a second here, we'll see a PRP that is outputed
and it'll be within the PRP folder. So, we'll let it go um in a second here.
So, I'll go back to the chat in the meantime.
All right. Okay, there we go. So, it's looking to create Oh, wow. This is looking good.
Um, I'll go to the chat anyway, but I'll let it create this here. So, I'll say, "Yep, you're good to create this file."
Let's see. Uh, really good question from Jonathan. Can I hack the NSA with Archon? No, you cannot. Sorry.
The main benefit of Dynamus is the community. Yeah, honestly, I mean, there's a lot of parts to Dynamus, like the course and the workshops, everything
I've been talking about, but yeah, even just the community is just such a big deal. Like the ideas that people share with each other is insane there, and
it's just amazing to be a part of it. Um, so
yeah. Um, how is Archon? Okay, no, this is a really good question. Let's talk about this. How is Archon better than
Context 7? Yeah. So, Archon, I mean, there's a lot more to it besides just
claw taskmaster and context 7, but some of the core things for Archon, at least until we like really start to expand the
vision pass beta, the core parts of Archon is really we've got task management like we have with Claude
Taskmaster and then we have knowledge like we have with contact 7.
But first of all, it's better because it has these things combined into one MCP. Also, it's just a lot easier to manage
things because we have a beautiful user interface. So, like with Claude Taskmaster, it's a nice way to give the
coding assistant a way to manage tasks internally, but it's quite hard for us to actually manage things ourselves. Like, when we're within Archon, as it's
implementing these different tasks, uh, wait, uh, okay, never mind. as it's implementing these different tasks, we
can actually go in and like fix the description or we can add another task without even having to interrupt our coding assistant because interrupting
can a lot of times lead to hallucination. And so it's our way we manage with the UI, the coding assistant
manages with MCP and it's all realtime connection and that we don't have that with other MCPS. And then then with uh
contact 7, contact 7 is pretty awesome. Like I I covered it on my channel and that video actually did really well.
It's an awesome MCP, but the thing is it's not your own private knowledge base. You don't get to pick the sources
that you have in there. Um, I think you can actually like add docs, but like it's just become this bloated mess.
There's so many different libraries that we have in there. Um, and so with Archon, you actually get to build your
own private knowledge base. And there's a lot of different rag strategies that I'm implementing, even more to come for
things like re-ranking and hybrid search. And you can actually configure them yourself. You can toggle them on
and off. And so there's a lot of room for customization, things that are going to keep building out as well. And also,
Context 7 is not open source. And Archon is and will forever be an open- source platform. Contact 7, their MCP is open
source, but if you actually go and look at the code for Context 7. It's a super simple MCP that calls into a private
API. You don't get to see any of their implementation or code and they're going to be monetizing it. So yeah, awesome
MCP, but there clearly are some differences with that and Archon. Context 7 is going to be easier to use,
but you can't really customize it. I think that's really what it comes down to. So yeah, that's a really good question, though.
Um, let's see. Got another donation. Thank you very much for the donation. Will the live stream be available for
watching later? Switching to Linux, by the way. It's way better for development or switch to Linux. Yes. So the live
stream will be available later. Definitely 100%. So all live streams on YouTube are automatically uploaded after
some processing time. I don't actually have to like record it separately myself or anything. And then uh switching to
Linux, I appreciate the recommendation. Um I've thought about it definitely and
like whenever I'm hosting something in the cloud, I'm always using an an iuntu Linux instance. So yeah, I mean I have a
deep respect for Linux. Um but I like Windows for some of the things that like Linux doesn't have. Um, like, okay,
don't quote me on this, but between OBS, Cap Cut, and Photoshop, like the three main tools I use for video editing, I
don't think all of them work with Linux, or at least not as well. From some research that I did before, maybe that's
not 100% right, but yeah, I'm just very comfortable with Windows, and I've been using it since I was, you know, what, like six years old. I started with like
a Windows XP laptop back in the day. Um, so yeah.
Um, let's see what else we got in the chat. Oh, this is a good question from
Emerson. Any any members of Dynamus that aren't developers? Curious what the expectation is for those without coding
skills? Yeah, that's a really really good question. So, uh short answer, not everyone is developers. Definitely not.
We have a lot of people that are more beginners getting into AI and building automations and agents. the the I would
say that the only requirement for Dynamis is that you have an aptitude like a hunger for diving into these
things not necessarily becoming technical but getting comfortable with no code tools like NAN learning how to
leverage AI coding assistance like if you have that desire then Dynamus is the place for you and there's so many
resources and courses and workshops and community and people sharing ideas for all of those things and so we there's a
a large audience of Dynamist or core membership of Dynamus that is technical.
A lot of people that are more semi-technical like they have an aptitude for building agents and automations that are just kind of
getting into it and leveraging coding assistance and then definitely some beginners as well. We have a lot of that. Um so there's a place for
everything and I and I really do create a lot of resources and content in the community and even the course like is
beginner friendly too. So yeah, definitely be a part of it if you're interested and you're just starting to get into these things.
Um, from Kev, thank you again for the donation. Appreciate it. After my home server question, Proxmox, that is the
one that I was uh trying to remember the name of because I haven't used it myself, but John is like big on Proxmox
and uh he uses it for running Olama in like a IP address connected into Archon.
Uh maybe a future capability to easily deploy to Proxmox VMC please. Yes, that
would be amazing. Yeah. So also back to the context 7 question, the other reason
that archon is special is because it's possible to host things 100% locally.
You can host superbase yourself. you can use Olama or at least the full support for it is coming very very soon for Ola
and so it's going to be possible to have everything entirely private and that's a huge advantage that a lot of people are looking for like you kept and so doing
things like what you're describing here making it easy to deploy to a local server like that is a priority for us
it's one of the things that we definitely want to add in like before we ever go out of beta like that will be in place 100%
um donation from daily profit dynamis is costlier for me or Indian community.
Yeah, I first of all I appreciate the donation. I totally understand. Totally understand. Um but unfortunately
geographical price parody is something I've looked into but it's not possible on my platform. We have a lot of people in India though. um and like they're
getting the value out of it that it's worth it even even for um even when like the currency doesn't go as far I guess
is the way to put it. I don't know how to word it best exactly but yeah I understand the concern but it's it's um
it would become a nightmare to manage like geographical price par where like depending on the region of the world the
price is different. It's like that's not something that uh like someone like one person starting a community can manage
very easily. There's no features in the platform for me to do that either. Otherwise, I would love to look into that because I want to like the price of
Dynamus is because people who invest in something, they end up getting more out of it. It becomes a commitment versus
something that's free. If people are just um investing their time and not money, like they get less out of it. It's like a it's a psychological thing.
Like it's real. And so like I if I could be more like geographical price parody like things like that, I'd do it. But
it's it's just difficult like gonna be honest. So yeah,
um Archon merch win. Also, um Mac OS is the way. So I did actually get a Mac
computer a couple months ago. Um my wife uses it for editing. She helps me edit my videos and also um what was the other
thing? Yeah. Yeah. So like testing like the local AI package and like Archon and stuff. I want to test on Mac as well. So I got it for that. Um, so I do have a
Mac, but I primarily use Windows because I'm most comfortable with it and I uh built a computer that can run local
LLMs. Um, that's better than the the Mac that I have. So, yeah.
All right, another donation here without a comment. Um, I hope that wasn't an
error mark, but I do appreciate the donation. Thank you very much. Appreciate it a lot.
um a one oneclick installer script for Archon. So yeah, I'm highlighting this
specifically because I don't know when we would get to this point, but I would definitely want to. I want to make it as
easy as possible for all of you guys to be able to use Archon, especially for people that aren't as familiar with open source and hosting things and superbase.
Like the setup instructions are quite simple compared to most open source projects, but there's still a couple of things that you have to get through here
and you have to be comfortable with a couple of things like setting up ENB and running SQL scripts. It would be awesome
to create a oneclick installer. And just in general, I want you guys to know that like we are putting so much effort into
making it as easy as possible to use Archon. like the onboarding flow that we added. Raasmus added that recently to
Archon and he's doing like some more things to like help you detect when you have your like anonymous key instead of
service key and like when your server is down and helping you look through the logs. Like we're we're working on those things, trust me. So, I appreciate you
mentioning that. Um, so yeah, let's actually go back in the terminal here because we have our
PRP. I'm going to get get back to the the coding for a bit, but I really appreciate being in the chat with you
guys. Um, so like I said, like we're we're going through this thing. I don't think we're going to build it from like fully build it here. Uh, because the
focus is just showing you how to integrate BMAD with Archon. And now we're talking about PRP as well. We're freestyling and I just want to talk with
you guys, have a chat with you guys and and answer your questions. So, I'm putting a lot of emphasis into that as well. But yeah, here is our PRP.
So, I'm going to open a preview of it so we can take a look. Uh, there we go. At our purpose, our
core principles, and our goal. So, we're following the base PRP. This is the template that we're basing this off of.
Um, let me go back. There we go. So, we got our Y. We got our what what we're building here. We got our success
criteria. Here's all the documentation that we want it to uh read through,
which that's good, but also I want to tell it to use archon as well. So, I'll
say use archon for cloud code SDK and nex.js docs.
Um, yeah. So, I'll just I think I'll just leave it there. That's good. So, within the documentation and reference,
I didn't really I should have been explicit in creating the PRP that I wanted to use Archon, but this is going to work as well. So, I'll just add it
here. Must read. You must use Archon for cloud code SDK and Nex.js doc. So, we can kind of more supplement the research
that we've already did with the Archon MCP. And then doing some research on like Xterm and and real-time patterns.
Looks good. Here's our desired code base. See, this this is beautiful. Like, this is what I like seeing. And claude
actually does a really good job at respecting the desired codebase tree. And so this is what our end result is
going to look like where we have um we have our API where we have the routes for managing cloud code instances. We
have the different components for displaying the terminal and the logs. Like this is really good. We've got
known gotas and then we have a lot of pseudo code here and the list of tasks that need to be implemented here which
I'm going to just tell it to use archon. So maybe there's a little bit of a disconnect here. Um but yeah, it looks
pretty close to what we actually had in in um Archon. So I might have even referenced it. I'm not totally sure
exactly, but yeah, then we just have a lot of pseudo code. So yeah, and then uh yeah, I guess the very last thing is the
validation gates or validation loops. So one of the really important parts of the PRP framework is telling the coding assistant how it can iterate and
validate its own output. So like with linting checks and we're going to have it write unit tests and integration
tests. Uh which I'm actually going to take out integration tests because that's probably too much for right now.
So I'm going to go ahead and take this out. So again, just like without with validating code that's outputed from
your coding assistant, you want to validate the PRP before you execute it. Make sure that it's aligned with what
you want to create and that it's not overengineering because that's another big thing that coding assistants do. Like I was talking about earlier, we got
our final validation checklist and then some anti-atterns here. So, we're looking good. And our confidence score
is not as high as I want it to be, but just for the sake of brevity, I'm going
to go ahead and kick this off. So, I'm going to clear the conversation
and I'm going to say execute PRP. And then the path to our PRP is PRP's claude
code instance manager MD. And then uh the other thing
is I'm going to kick this off. I'm going to say use the archon project for task
management and archon for rag. Um and then I'll say the project is and then
I'll go back into here. I gotta I keep I should just like
memorize this. Let me copy this. Cool. Go back in here and paste that. All right. There we go. Okay. And it
actually was checking for projects already. So it it knew to use Archon, but now I'm just being explicit telling it which project to use. So there we go.
So now now it's it knows which project to use, but it's going to look there already anyway. So all right, we're
using Archon right away for our implementation. And um
yeah, let's see. I'll go back to the chat for a second here. Actually, I um I
think I need to take a bathroom break. That's so silly. I've never done that in a live stream before, but it's like
getting so bad right now that it's like hard to talk. Um so I I think I'm going to mute myself
and uh you guys can watch this go in the implementation here and I'll come back in just like a minute. So I will be
right back. Oh, that I I turned off my display. I need to turn off my video. Okay, there
we go. All right, I will be right back.
Okay, I'm back. That was TMI, but that was the longest of my life. All right,
let's go. All right, so we're starting by creating a next app. Okay, so that's
good. So, we're we're taking the first task from Archon, which uh let me actually go and u make sure. Uh wait,
no. Yeah. Yeah. Okay. So, let me refresh because I need to start it up again. Um,
hold on. Okay, there we go. All right. So, we're
we're in progress with our first task here. So, this is perfect. So, we're initializing next.js and it's running
exactly the command that I hoped it would. So, it's running the create next app, which if you go to the Nex.js documentation and it um probably even
performed rag to figure that out. I didn't see exactly, but yeah. So, we have the right command. So, it's going
to create the boiler plate for an XJS project in our codebase. And there's quite a bit to go through here. I don't
think I'm going to get to the end of the implementation in this live stream for you guys, but you've seen the full process of integrating Archon with BMAD.
I mean, it is a little bit messy because I'm really figuring out for the first time, but like I said, that's very much intentional here.
Um, you left your mick on. Did I really? Wait, hold on. because I I
I did the mute button. No, I I muted it. I know I muted it.
Unless you guys are just trolling me,
maybe. I mean, I don't care. I mean, just means you guys heard me go.
All right. All right. So, let's see here. Echo Y.
Mike says no. Thanks, Mike. He was kidding. Uh, that's like every
every live streamer's worst nightmare though is accidentally leaving their microphone on. Um, wait, what is it
doing here? Okay, sorry. I wasn't paying attention to its output because it was deciding things for me for creating the
next app. Um, what is it doing?
You know what? I might just need to create it myself.
You know what? I might just run this myself. I I don't know if I trust it to to do everything right. So, let me go
into I'll just go in and run this myself. Open source bead app. Paste this
in. Okay, I'll run this myself because I I do want to use ESLint and Yeah. Okay.
Okay. There we go. So, I'm going to say so I'm going to go out here. I'm going to say no and tell Cloud what's to do differently. I'm going to say I created
the next app for you. Go ahead and mark this task as done in Archon and move on.
And I don't need to like explicitly say in Archon, but I'm just trying to be explicit here because I feel like that'll be helpful for demo purposes.
But yeah, I'll just have to let this run here to create the the boiler plate for the next app.
So, um yeah, here we go. We got the app created, which
actually I kind of want this outside. Let me reveal in file explorer. I kind of want to fix this up.
I'd rather just have this all out like that.
Then delete this. Okay. Wait. Why is it
Let me delete it. That's weird. Okay, I'll just leave that
folder. Whatever. That's fine. Okay, so now I fixed up the structure. Okay, now we're good. Now we're good. So, I'll go
back to my terminal and I'll close this one and I'll tell it to move on. Okay,
you're good. So, there's two things I could do here for the the rest of my
stream. I can either focus on a lot of your guys's questions
or try to get this implementation done. Um I think what I'm going to do, let me
go back to Archon. Make sure it's moving through the tasks fine. Okay.
Yeah. Okay. So, we're looking So, I'll I'll let this run here. So, we got one task that's done. Okay. Now, it moved on to the next one is in progress. So, now
it's installing configuring cloud code with Xterm. Okay. So, we're good. So, it's moving through the implementation. Now, the rest of this we're just going
to have to wait a while because it's going to have to knock through all these tasks, but you can very much see that it's doing so and it's leveraging archon
and this is beautiful. Uh, and it yeah, it says to MP install some things. So, I think I think the plan here Yeah. And
you guys are saying questions. I think we're going to do that. We're going to do that. So, I'll let this run and I'll like try to pay attention and like approve things if I need to. But I
definitely want to um chat with you guys more, answer some questions, and then
continue to talk about the the long-term vision for Archon. So, I think the plan is to I'll let this live stream go uh
I'll I'll end it in 40 minutes for sure, cuz at that point, it will be a three-hour live stream, which I'm down
for that, guys. I have so much fun with these. Like, the time flies so fast. Like, it still feels like it's um the
streams are only going on for one hour, not two hours and 20 minutes. So yeah,
but I hope that you guys can see there there's like two big things that I wanted to show you guys with this live
stream. One is I wanted to take you deeper into actually leveraging Archon,
showing you guys the power of it from the perspective of kind of more just like experimenting with it. Like it's
nice to have something that's super super structured like my video on Wednesday, like boom boom boom, here's a demo. Here's something I already prepped
for you guys. But then there's also a lot of value in just doing something really off the cuff like I've done here.
The the word freestyling that I've been using way too much this live stream. Like it very much is true. And there's a
lot of value in that. And so like I wanted to just show you guys like Archon from scratch. Like let's just play
around with it. Let's dive into the different features. And then the other big thing that I wanted to show you guys that I think worked out very well is
showing you how to use Archon with a different context engineering strategy like BMAD. Because one of the things
that um I've seen some people comment that I I just want to be very clear on and I hope that this demo made it clear
is that Archon in no way replaces your existing strategy. It is additive. It
has rag and task management. those two components of context engineering that a
lot of other strategies don't have like PRP
um claude flow BMAD spectrum development like they have they kind of have it but
like archon does that part like that's where it specializes and so that's that's what I wanted to
show you guys and I think it it ended up working really well doing BMAD with um with uh Archon. So yeah, there we go. We
we finished this task. We're moving on to the next one now. So, it's looking good. Cool. Cool. Yep. So, we're
updating the next one to doing. So, what what task is that here? I guess. Yeah. So, it uses a task ID, but yeah,
basically what is in doing now is we're creating the cloud SDK wrapper class with TypeScript. And there we go. We got
our description as well. So, sweet. All right. And and by the way, I could like update the description in real time and
like have it reference the task again if I wanted to correct it. So, without even having to interrupt it, I can fix
things. That's the one of the nice parts about the task management that we have in Archon. So yeah. All right. So that's
a little bit of like a recap of what I just wanted you guys to get out of this. So uh yeah, let me go back to the uh the
chat here. Another question that I saw that I appreciate a lot is um this one
here. So why why use superbase and not just another or local database? So quick
answer for this one. I'll try to be kind of concise more concise in answering some questions here. So nice and quick
one for this is um Superbase is just the easiest to work with. I love their Python SDK. So that's why we started
with it. Uh I kind of wish I implemented like just Postgress from scratch though.
And at some point we definitely want to move archon to supporting all Postgress databases. So still superbase like local
or not. Uh Neon self-hosting like just vanilla Postgress. We want all that to be possible. So instead of giving the
superbase URL and service ro key in your env string for Postgress which can be
superbase still. So we definitely have that in the future.
Uh what are we building again? Yeah. Okay. So I'll I'll give a quick recap of that what what it is currently working
on here. So uh what we're building is a front-end application to manage
different cloud code instances. So we we're the end goal is to have a UI
kind of like this where we can like spin off different cloud codes to to code different things for us and then we can
like easily click between the different terminals to see the logs and maybe even have them like coordinate together and stuff like it's the kind of application
where you just want like a a nice UI for managing cloud code just like archon's a nice UI for managing our knowledge and
tasks. So that that's what it's currently coding here and we went through the whole BMAD process to like plan things in a lot of detail and we
created a PRP that we're executing now. uh definitely cutting some corners to speed things up. Like I said, you you
certainly want to spend a lot more time with your analyst and your project manager and validating your PRP. And I I
don't want you to um do what I Yeah, I want you to do as I say, not as I do,
right? Like I'm I'm just telling you how I'm speeding things up, but in general, you want to do a lot of validation
yourself. So yeah.
Um let's see what else. All right, another question here. Good
question. Let me go back to my stream. I want to ask again, wouldn't it be better idea to have ready-made boiler plates to
start with and have the agent choose the best one that fulfills most requirements and build on that? Yes, definitely. And
um yeah, that's one of the things that I was talking about earlier for one of my long-term visions for Archon. So, I I
love talking about the long term for Archon because as exciting as it is what we have built right now, there's so many
more things we have to make it like way better. And so let me talk about that again. And this might be like a little
bit of reiterating, but still it's it's it's really cool to talk about and just like get our brain juices flowing for
what's what's possible with a tool like Archon. So one of the things that we have in the Dynamis community
is I've kind of been referencing this but I haven't been showing it yet. We have the context engineering hub. So,
this is private to the Dynamus community, but I definitely want to like share a lot of these resources um with
all of like just to my YouTube channel as well. But one thing we're working on in Dynamis together
is we're working on the context engineering hub. This is going to be
basically a a gold mine of resources for PRP templates and slash commands and
global rules and cloud hooks and sub agents that everyone is contributing together as a community. He started this
like really recently actually. And so the goal with one of the goals with this is to eventually integrate it
with Archon where Archon can look at this context engineering hub and it can say and you
would tell it like I want to build a Nex.js application or I want to build a pideantic AI agent and archon will
search through these different things just like it searches through knowledge with rag and it'll be like oh sweet here
is the pyantic AI PRP template. So you have a boilerplate like you said Ramy
and like oh here are some slash commands uh in uh cloud hooks and sub aents that will work well to help you build out
this agent and then oh here's the Python global rules like if we go to our global rules here and we're continue like we
just started building this out so there's not a ton here yet but we're working on a lot of resources here like here here's Raasmus' global rules that
he uses for all Python applications and so Archon would pull this because you're building a Python podant AI agent and
then it would go into your knowledge you' be like, "Oh, you're building with Pantic AI, so let me go ahead and and find the what I want to crawl for Pantic
AI, and then I'll go ahead and crawl that and add that, and then I'll make a new project for you in Archon." So, you have like all this boiler plate set up
for you to just like And by the way, look at how much it implemented already. We're already on task eight out of 20, which is pretty sweet. Uh, but yeah,
anyway, like that that's like the the dream for Archon to make it so that it is the command center for all context
engineering, just getting you started no matter the project that you have. And a lot of that does rely on us building out
this context engineering hub. But this and archon are like the two big things
that we have going on in Dynamis. Maybe that like and the AI agent mastery course where I show how to build agents
from start to finish. So like I said, a lot of really exciting things going on in the community. So if this sounds
interesting to you, like if you want to dive in and contribute and even just leverage these resources and be a part of the long-term vision for Archon,
dynamis.ai, that's the place to check out. So, I'm going to plug it again because it just relates so much to what
we're talking about here. Um, and everything that we got going on. So, yeah, let me go back and see where we
are at with Claude Code. Okay, so yeah, it's just chugging away like it's it's killing it. Nice job,
Claude Code. Actually, I want to look at our codebase, too, and see what we got so far. Um, so we got our dashboard
component. Oh, it just created the instance card. Nice. Yeah, it's looking good.
Um, has it done anything with Okay, so it hasn't created any API endpoints yet. So, I guess that'll probably come or no,
it has it. Uh, okay. So, it's just kind of created
the boiler plate at this point. So, nothing nothing too crazy yet, but yeah, we we'll let it we'll let it go. I'll
get to more questions in the chat here. All right. What hardware is it required
to run on? Good question. So, Archon is pretty lightweight overall. I'll go into
my Docker desktop. So, right now, Archon in total is using a little over one
gigabyte of RAM for all four containers. The the server is the biggest one. So,
you don't need that much memory. You certainly don't need the best CPU unless you are using local large language
models. You don't need a GPU at all. Like, you should be able to run Archon on any laptop. All that to say, it's
pretty lightweight. Yeah, good question though.
Will this video be on your channel after? Yeah, so Edia, good question. I do actually want to um tomorrow post a
kind of like live stream recap where I'll just like highlight the the big things that I've been covering here. Um
so I have to think about like how I want to structure that and it'll probably be like I I hope to make it like around a half hour like really consolidate a lot
of the things that we've been talking about here. But yeah, I want to do that.
Um what else we got here?
Yeah, I'm seeing some So, for all you guys that are saying some nice things here, um like priceless when it comes to
value, I assume you're talking about Dynamus cuz I was talking about Dynamus, but yeah, thank you very much. So, sorry I can't like showcase every single nice
comment in the stream, but just know that like I'm reading those guys and uh like it seriously means a lot. So, like thank you very much. I I always love the
positivity in these streams and um it's part of why it's so easy to go for so long cuz you guys are nice. besides the
occasional trolls and and all that has to happen, but like you guys are really nice in general and and it means a lot.
Um, what time is it for you? It is 11:30 a.m. for me. I'm in Minnesota, so
central time. All right. Um,
where does graffiti and Neoforj fit into Archon? Do we want to learn from experience?
Yeah, good question. So, we don't have graffiti and Neo4j built into Archon
yet, but we are starting to to do some experimentation behind the scenes and
just like thinking about brainstorming how we'd want to do so. The the main way that knowledge graphs will fit into
Archon is um well, I mean, there's a couple of cool ideas. Like, this will be
kind of off the cuff because we're we're like just starting to brainstorm it, but like let me share a couple things. The
first thing is that knowledge graphs are actually a pretty great way to store a codebase because you have like your
different classes that all have methods and then those methods have attributes and functions um or attributes. Well,
no, I said that wrong. Your classes have methods and attributes. So like you have like a hierarchy of things like files
have classes, classes have methods and so you can have a knowledge graph that like stores a code base or even like a
external library and then archon can um like with graffiti like it can expose functionality to the MCP server to like
search through your codebase as like just another way to index it um or to search through the right syntax for um
external libraries like I did with some of the knowledge graph experimentation and the crawl for AI rag MCP. So there's
there's a possib a lot of possibilities there. The other thing that we could do with knowledge graphs is we could take
like one thing that the BMAN method does that I didn't cover here is they there's a lot of this like concept of sharding
where you'll take a PRD and you'll split it into different stories and epics kind
of like you have in like Jira if you guys are familiar with like Jira or ClickUp or just like more like project manager kind of stuff um that I'm sure a
lot of you guys are familiar with and um one thing we could do with knowledge graphs and arch on is take that kind of
sharding that the BMAD method does and create a knowledge graph of all the different stories and epics and how they
relate kind of as a way to um build a long-term memory around like the
different things that were done and like how the features were related to each other and even like dependencies that
they had on each other and things like that because it's all very relational. And this also gets to the last thing
I'll say again the really like offthe cuff here but like interesting things to think about. Um, we had that question
earlier about like using the entire cursor chat history as long-term memory for the agent. And my suggestion there
was more like I would actually like get to like different checkpoints in your code and have it output a markdown file
with like a summary of what it changed and like what's next, like that kind of thing.
Now, that would be another cool use case for knowledge graphs because you could have all these markdown files that are
like checkpoints for your codebase and like the different checkpoints will have like different features that are related
to each other. It'd be kind of like stories and epics, but like like that would also be a cool thing to store in a knowledge graph so that Archon could
expose tools through MCP for your coding assistant to like search through past implementations so that when you're
working on a brownfield project, an existing codebase, you can more easily see like even without having to search
through the codebase, what are the like architecture patterns that I need to be following here for a new feature? because I'll just search through the
knowledge graph to find existing feature implementations, the ones that are like the most similar to what I'm about to
implement. And then I'll just copy that structure for the codebase because generally you want to keep your codebase consistent with um your formatting and
the different like um patterns that you're developing in your codebase. So yeah, just yet another cool idea there.
So I know that it's kind of like random thoughts all over the place. Um but it's just fun to brainstorm that kind of thing. So I'm just sort of doing it live
with you. But yeah, I appreciate that question. Oh, can't get enough of your vibes, bro.
God bless you. I appreciate a lot, Ahmed. Thank you very much. We just have fun on these live streams. That's what
we do. Freestyling. Um, let's see. I need to read through and
find the next one to showcase here.
Um, okay. Is Docker Yeah, good question. Is Docker Desktop a requirement or can I spin up a Linux box with Docker and run
Superbase and Archon on that and connect remotely? Yeah. So, uh, two things. First one is
you do not need Docker Desktop. I guess I added it more as a prerequisite
like quickly click into the container to see the logs and see if there's any errors that they want to share in their issue when they report it, things like
that. And so then people don't have to learn like you know docker ps- a or like
the docker log-f docker compose like you don't they don't have to like learn the syntax of those commands if they just
have docker and docker compose and not desktop. Um so actually I don't need it to run
npm rundev. Um don't run npm rundev because that's
going to hang. So okay sorry I have to like make sure this keeps going too. Um anyway so yeah you you can use just
docker. My warning though is um Archon does not have authentication right now. It's meant to just run locally. So if
you host it in the cloud and you expose it, unless unless you like have some way to like securely access the machine
that's not over the internet, then I wouldn't recommend doing that because it's not Archon's not protected. There's not a way to add your own authentication
into it. In the future, we definitely want to we want to make it so that like you can configure your own O so you can
host it remotely and like have your friends log into it or or your co-workers or whatever. Um, but then
it's it's like exposed the internet but not like unsafe. Um, but like right now it's meant more to just be run locally
just as we're in beta.
I just shorted in my Right. Whenever whenever um the BMAD method says
sharding in their documentation or in their YouTube videos, I I think of that as well. I'm going to be totally honest.
Like, yeah. Um,
knowledge knowledge graphs are a great source for training data generation. Yeah, 100%.
Um, okay. This is a good thought. Your projects aren't separate islands. Link a
task from project A to B with one click. When you update in one place, it updates everywhere. Yeah, I mean that's that's
true. I mean, I'd have to like dive in a lot deeper with you to like see exactly what you're getting at, but like in general, I agree that like your projects
aren't separate islands, especially because like one thing you can do in Archon, um, is like,
and I haven't done this myself, but I know Sean, one of the other maintainers I've been talking about, like he he has
Look at We're almost done, by the way. We got three um three tasks in review.
We're almost done here. Um, I lost my train of thought. Was it? Oh, yeah. Yeah. Okay. So, one thing that I haven't
done, but like Sean's done it, I've seen some people do with Archon, just when it was in Alpha in the Dynamis community, is they will manage different stories
for the same workspace codebase in different Archon projects. Because
sometimes, like I made things simple enough where I broke it down into 20 tasks, but if it's actually something
nuts like this where it is 124 tasks, then it makes sense to split things up more and have different coding agents
managing different projects in Archon, even though it is the same codebase. And in that case, you definitely would want
to be able to link different tasks between projects in Archon. I agree 100%. So yeah, there's definitely a lot
of different ways that we can expand the task management here and make it a lot more robust both for the UI and the MCP
server for the agent to be able to do those kind of things itself. Like maybe even having Okay, this would be so cool.
making it possible for sub agents that are operating on different projects in Archon to be able to communicate with
each other and like come to an agreement on how they want to link things between projects. That sounds kind of dangerous,
but also like really really cool. Like just get your juices flowing for the kind of things that we could do with
Archon. There's so many possibilities. Um,
you're all good. Don't worry about being late. Just happy to have you here. Keep up the great work. Can't wait to dive in. We'll be working heavy on this
today. Just got my 5090. Well, congrats. That's cool. 5090s are a beast because
Yeah, you got you got um 32 gigabytes of VRAM with that, don't you? That's pretty cool.
Um let's see.
Yep. So, this is going to be the live stream will be available for playback and I'm going to do a recap video as well probably end of this weekend.
Let's see. Oh, cool. Wagner Hey, Cole just joined tested Archon. It's so helpful. Thanks a
lot. You bet. Glad to hear it. Yeah. And if you guys want to just like share in general things you built with it, I'd appreciate hearing that a lot, too. But
yeah, getting a lot of feedback already on Archon. It's super positive. And and I'll be totally honest, like there there's people having problems with it
and there's bugs with it because it's in beta. We're working through those really hard. Maybe not as hard this weekend.
going into next week, we're going to be working our butts off on a lot of these things and really touching up Archon in beta. But like aside from that, like a
lot of really positive feedback and it means a lot and I'm glad that that our vision is coming to life in the way that
we hoped it would be and that you guys are are using it in the ways that we dreamed that people would and that we're
using it oursel. It's really cool to see. Um, so yeah. All right,
let's see. Okay. Yeah, another good question. Um, can I add context manually
and just use the task management from archon? The answer is yes. So if you want if for some reason you really want
to use context 7 as u for your knowledge or if you want to just like upload your
own documents into the codebase and reference those for documentation like we've done with PRP before and you don't
want to use archon for that but you still want to leverage other parts like docs or tasks, you can definitely do that. And so it's all up to you. Um, let
me pull up Archon again so I can answer this with a visual for you. If you go to
the uh global rules here, this is a template to get you started. Here's our
recommended global rules to give to your coding assistant so it understands how to use archon pretty well. But you can
you can change this however you want. You can specify in the global rules
never use rag with archon. Only use it for task management. If you want to, you can do that. And you can even I mean
that's kind of like an easy way to just disable certain features. Just tell the coding system to not leverage those. Instead, go to this folder where I have
documentation uploaded for um my business or the libraries I'm using. Um
you can definitely do that, Alex. So yeah, 100%.
All right, let's see. Yep. So yeah, full recording
will be available after some processing time. You just have to go to the live tab of my channel and it'll be available. And I got the recap like I
said. So yeah, what about the integration with block or
goose? So the basically any coding assistant that supports MCP can use
archon. We just only call out a couple here just to keep it concise. But like
really if you look at the docs for how to connect Archon to the coding assistants we lay out here. You can
extrapolate that just following the guide from that other coding assistant on how to add MCP. Like I believe Goose
MCP I believe they have MCP support.
Um maybe do they not? I don't I I haven't used Goose myself before.
This is the one from Jack, right? Isn't it? Um or maybe I'm thinking of
something else. Like if I go to X, does that go to Yeah,
never mind. I'm probably thinking of something else. But yeah, if it supports MCP, then you're good. I'm not 100% sure
if it does. I haven't used it myself. Well, all right. What else we got in the
chat here? We've got a donation. Thank you very much for the donation. Did the YouTube as a source feature get
installed? Uh, so no, we haven't implemented that yet. I mean, right right now, I'll kind of tell you guys
like medium-term goals for Archon. So, short term, like very short term,
there's just there's some things to like really polish up with with Archon. Uh,
like for example, if you go to the docs tab, um, like the docs aren't like perfect yet. Like if I go to the
markdown editor, there's like some like things like this where it's not rendering the object like little things
like that. There's some sometimes the crawling gets stuck. Like there's little things like that. Like we really really really want to polish what we have now
in the short term. And then there's um some improvements we want to make around like how easy it is
to get it set up like I talked about like improving the onboarding flow. A one-click install might not be in the
short term, but like something getting to that. Um yeah, just like we want to make it really easy to use and we want
to make it like work 100%. Like that's the short term for for beta. And then
medium-term, we want to start to integrate some of the things that I've been dreaming up with you guys in this live stream here, like how it can
integrate with your all your context engineering and like pulling in templates. Um things around knowledge
graphs we're talking about or extending the task management. Um maybe just like
refining the global rules that we have that we recommend adding in so that it can leverage archon better, integrating
with different context engineering strategies like BMAT, like all those things are a priority. other forms of of
knowledge like other sources. I don't not sure exactly when that fits into our timeline, but like something like being
able to ingest YouTube videos. I don't it's hard for me to imagine like where that fit into the coding process. Um,
however, I will say that at some point, and this is like guys, there's so many things for Archon. This is yet another
long-term thing possibility for Archon. Archon can be more than just coding.
Like I want you guys to like wrap your your head around this for a second. We can do so much more than using Archon to
assist with AI coding. Like what you're seeing in Claw Desktop here, it's just a
way for it to like perform this these advanced rag searches on anything that
we upload. Like this could literally just be like the backbone of any agentic rag system that we have. And archon can
be where we do the ingesting and how we have like our advanced search strategies like hybrid search and reranking and
things implemented in. So it's just like out of the box super powerful rag and it's not even doesn't have to be for coding. This could just be for our own
business documents that you can already upload or or like you're saying bro truth it can be just for YouTube videos.
You can search across videos on a channel that you want to catch up on. Like we could literally use archon for
that. Like I'm just using it in claw desktop. It's not even through a uh a coding assistant. And so that's yet
another thing like Archon could become general enough where it's just like the MCP server to make rag better no matter
what you're doing with agents ever. And that would just be so cool. Like we can literally do that. Um so yeah. Okay. Um
our application is it actually ready? Okay. I'm going to try this. I I doubt it's going to work
first try because I cut a lot of corners to just like speed up things and show you guys the whole BMAD. But let's try
this out. Actually, this would be so cool if we at least get some kind of visual here.
Uh, let me make sure npm install. Let me make sure everything's installed first and then I'll try to run it. Okay, npm
rundev. Um, okay. No errors. Oh, that'd be so cool. All
right, let me let me spin this up.
Uh, okay. So, it looks really bad. It looks so bad. I guess maybe there's
an there must there's probably a tailwind issue.
Yeah, there's a tailwind issue. Okay, so so the the uh CSS isn't working. It's probably a simple thing, but
help me help me make a million dollars. Create instance.
Okay, that's actually really cool. Um,
okay. So, we got another error. Okay. So, we got a couple of errors, but like clearly it's like kind of there. Um,
there's two things we'd have to fix. Okay, let's try to fix I'm actually
Let's try to fix these. So, I'm going to go back to my cloud code and say I'm getting this error for tailwind CSS.
And then also uh when I start a claude instance, I get this error and it is
stuck on what is it stuck on right now. So I'm just trying to be like kind of specific here. Usually when you're troubleshooting things with coding
assistance, it's helpful to be like quite specific on like when the error is happening, what the error is. So it's stuck on processing prompt this error.
I'm just typing this off camera really quick. So I'm going to copy this. Uh if I go to the issues that we're getting.
Uh there we go. If I look at the I forget how to Oh, yeah. Here we go. Um,
I'll just copy the full call stack here. Okay, there we go. So, I'm sending it
in. I accidentally pasted the call stack twice, but it's probably fine. But, yeah, let's just have it lock out these
things and we'll see what we can get. So, I'll just be ready to run it again here. But, okay, that'd be so I mean, we
got like kind of something. It looks terrible, but um I there's no way I would expect to oneshot this application
even if I spent a lot of time architecting and validating the PRP,
which especially because I didn't like I definitely wasn't expecting it to be great out the gate, but I I feel like
just just with like my intuition and experience with coding assistance and what I was looking at there, I don't and like how specific the errors were, I
don't think we're that far from at least having something pretty cool. So, I don't think like I'll probably wrap up the stream in the next like 12 minutes
here. So, we probably won't have anything that I can like really show, but um I mean we're like we're like there
kind of well, sorry. We're there to the the first iteration where we can now start to just do the troubleshooting, which I mean that's kind of the boring
part is doing the troubleshooting. I don't want to walk you guys through that.
Um, but yeah, I I will say though, um, maybe like the last time that I'll just uh mention this really quickly for you
guys is if you do want to see something that like is really really end to end, like super structured, let's come ready
with something like that I know is going to work and we'll actually like dive into the full process, not cutting corners for speed. That's what this
workshop is for. So the half-day workshop, my full AI development workflow where I'll I'll go through like
the full strategies that I actually use because again, today was BAD plus archon, more experimental. Let's play
around with something like more from scratch. This is going to be something that's going to be a very structured
interactive session that you can follow along all my strategies all in one session. So definitely come be a part of
Dynamus if you sound if that sounds interesting to you. So we got this happening Wednesday, August 27th, but
also definitely sign up this weekend because prices are increasing for the community. So you can lock in your price forever if you sign up this weekend. So,
just wanted to call that out because it's uh yeah, it's kind of like the next step if this was interesting to you in
general, but you want to like really get practical and concrete in a way that you can like apply things and I'll be like
speaking a lot more also to like how you can be applying these things to your AI development workflow versus this is more
like experimental and showcasing. So, hope that makes sense. But yeah, let's um let's check on Okay, so it's still
working on some fixes here, which um
I don't it's kind of random. This is weird.
I don't like this because it's like instead of trying to fix the underlying problem with Tailwind, it's just like adding u styles without Tailwind. This
seems like it might be hallucinating, but that's okay. That's all right. We'll let it go. We'll
see what happens.
All right. Hm smoke dab. Your archon is goated. Thank you very much. I appreciate smoke
dab. Uh donation from Johnny. Thank you
Johnny. Appreciate it. Congrats on the launch. Cole. Will the stream be available later? Yes, it will. Yep. So all all recordings or all live streams
for YouTube are available if you um after just some like processing time when the stream ends. It'll be available
in the live tab of my channel. And then also I am planning on doing a recap video that'll probably go out tomorrow
night. So yeah,
thanks Jay. Thank you Cole. Great launch party. Glad to be a part of your community. And thank you and Sean for all the hard work on Archon. You're very
welcome. Yeah, thank you Jay. And uh appreciate everything you've been sharing in the community recently as
well. To be fair, even at this stage of the project, this one shot would have taken
weeks before these tools. Exactly. Yeah. You're you're saying what I should have said anyway or what I should have said
to begin with is like even though it like looks terrible right now. I guess I
can't like show it again because it's in the middle. I tore down the site but like even though it like looked really bad like even just like getting this
boiler plate up and running and like we know that we're relatively close to an implementation like creating all this would have taken so long without AI
coding assistance and trust me been there done that. I've been coding since I was 8 years old and I did not have
coding assistance until last year. I I never even used like GitHub copilot or anything. Like when coding assistants
first started to be a thing, I got to be honest like at first I was like these things aren't worth my time and like the
tab autocomplete like before we had like full agentic coding it just wasn't impressive for me and I only used it a
little bit. And so like last year is when I really got into coding with AI starting with Windinsurf. Wind surf was
my first ever like full agentic coding assistant or at least at the time what
was considered like top agentic coding. I mean obviously it's what was then is not anything compared to like what our
tools can do now even like half a year later but still it was that was the code back then but um yeah so like all
everything we created here is like working yeah maybe 80% like you said
it's the 8020 rule. We got 80% of the way there in like an hour, couple hours.
Like it's super cool. And we're going to keep iterating on this and hopefully get to the point where it is
uh we'll get something here. Maybe in like the last couple minutes of our live stream at least I'll have like a nice UI. That'd be really cool. So we'll see
how far we can get. It's just doing some last checking here. So I think we're almost done with this implementation or
with the fixes that I asked it to perform. Um so cool. I'll I'll go through a couple more questions and then
hopefully we can spin it up again and try it out. Yeah, you're very welcome. Great demo.
Appreciate it, Mike. Thank you very much. Part two of the live stream, Martin. Yeah. No, I I won't be able to
do a second part tomorrow, but I got the recap video. And and also the other thing that I want to say is with my
channel going forward, one of the big things that I want to do is I just want to showcase a lot of like full builds
um like using archon, using PRPs, and like doing a lot of like agent development I think is something that I
want to focus on. So, if I go to my channel really quick, let me just go to YouTube. Or maybe I'll do this off uh
camera so I can pull up my um channel
the polls here. Okay, so let me show this here. So,
yeah, the poll that I put out a couple weeks ago, I asked what AI center content you want to see more of. And I
actually thought context engineering would win. I was kind of surprised, but building complete agents like full use
cases. This actually won by a landslide. There's 1.5,000 votes here. And so
something that because I went down to one video a week on my channel, so I could put more time into each video. And so one of the things I have with that is
I I think it'd be super cool to like showcase like full agent builds. Like here's start to finish. Let's build an
agent. Let's use archon for task management and MCP. We'll use cloud code and we'll use our strategies for context
engineering. So, like, excuse me. Really like going through and giving you guys all these examples of building agents,
showing you kind of the the culmination of all these different strategies and stuff that I've been talking about on my
channel. And then the big thing with that is then like if you want to go even further and like dive really deep into
everything that goes on behind the scenes to build agents start to finish, that's when you go to Dynamist. So, it's like the YouTube video is like you can
see me do it at a high level, but it'll I'll probably go like kind of quick because it has to I can't make like a
10-hour video every time. And so, then it's like if you really want to go through the AI agent mastery course to understand my thought processes and like
really dive into it with me, that's when you go to Dynamist like that. It's kind of an idea I have for for content for the channel. Um because it also is like
what you guys are really looking for. So, I think that'll be super cool. But yeah, looks like we
um we got our fixes in. So, I'm going to try running this and we'll see if we get
an error. Uh, okay. So, no error this time.
Let me refresh. Oh, no. We are getting errors. Actually,
it's even more broken now. Thanks, Claude. Looks like you're trying to Okay, Claude
messes up with Tailwind so much. Like by the way guys, this is why I use Lovable or like a tool like Horizons or Bolt for
uh building front ends because the weird things like it it screws up the boilerplate configuration so much. Like
it's just not understanding Tailwind here. So I'm just going to paste in this. I'm going to get kind of lazy here
because we're low on time. I'm just going to copy this error and paste it in.
And then I'll say um in the UI I'm getting this error because there's a
separate one that I'm getting here right now. Like it's not even it's not working. So I'm going to send this in.
Make this simple and fix it. Real prompting, guys. This is clearly
what I do on a day-to-day basis. But I'm just kidding. I'm just being lazy here because we're pretty low on time. Um but
yeah, I hope that we can get to something in a sec. But yeah, great stream. Thanks, Paul. I appreciate it.
Um, we need something similar to nearest neighbor, but for rag, allowing the
model to reference past knowledge and group them by association. Yeah. Yep. And that's what knowledge graphs are
for. One of the things that we're looking into 100%. Mike said, "Thanks for all the good
work." You're very welcome. I appreciate it, Mike. And and guys, thank you for everyone for being here. Like, this is a
record attendance for the live stream. Um, I know that like since the stream has been going on for a really long time, the the concurrent viewers isn't
as much right now as um was at the start, but we were at like 600 at one
point towards the start of the stream. Like that that is incredible. Like I'm humbled by that. So, thank you everyone
for being here. All your amazing questions and comments and your encouragement and uh going through this
this whole process with me. I hope this was valuable for you guys to see what it's like to just kind of go like the bottom up like I'm taking BMAD. never
really touched it before. Yesterday doing a little bit of prep like let's dive in and implement it with Archon and
see how we can do context engineering strategies with Archon. So yeah,
love to see a video where Archon could benefit from other creators products. AI community is amazing and and up to some
amazing work. Yeah, definitely. I mean that's kind of what I'm doing here at BMAD. Like there the creator behind
BMAD. Like that's that's it. That's his thing. And so I'm I'm hopefully doing
him a big favor by by show showcasing this because I think he deserves it. But yeah, I'd love to do more of that for
sure. Grateful for catching this live. Ah, glad to have you here, Bobby.
Um, let's see. Sorry, other creators could
benefit from Archon. He copied. Oh, you're good.
Claude keeps better um with Shad Cen. Yeah, that's fair. U and actually like
tools like lovable, they use shad cen by default. Um though I think isn't it common to use
shad CN and Tailwind together? I think that's a common combination like Tailwind is more like let's provide like
different classes for CSS. Shad CNN's like preconfigured components more, isn't it? Maybe I'm um misremembering.
I'm relying on coding assistance too much now, so I forget. Uh, yeah.
All right. Well, yeah, I'm going to end the stream relatively soon here, but I want to see the end of this.
Go faster. No, I'm just kidding. That's going to cause Okay. Well, the problem is we're almost at the auto compact, which is terrible, and that's going to
be long and probably cause problems. So, I hope that it can finish it soon. Um,
okay. I'm going to try something right now. I'm going to try running the server even though it's in the middle of stuff just because maybe it's to the point now
where it's working. Um Oh, okay. It is. It's kind of It's getting
there. This is cool. Okay, now we got a real UI. So, we fixed the we fixed the stupid Tailwind stuff for the most part.
Um Oh, yeah. So, it's just running the the type checks at the end here. So, I think it is pretty much done. Okay.
Well, yeah, 24-hour stream. Definitely not a 24-hour stream. Um, if you guys uh if
you guys look on my live tab on my channel, I do have a 12-h hour stream from before I really started diving into
YouTube. Um, I'll just leave that there and move on. But yeah. Okay. So, create a new instance. Code review assistant.
Help me make a million dollars. All right. Create instance. Okay.
I don't see any logs. And okay, so 2% right before the auto
compact we finished and it's um view terminal. Okay, so doesn't look like
it's working. So, okay. So, I don't know. I don't know
if we're 80% of the way there. Like I said, it's the expectation that especially cuz I rushed through some of
the things that it's not going to be like perfect perfect, but like we've got something to start with and Vive coding
is never going to get you 100% of the way there. And we definitely did like Archon helps with structured approach,
context engineering, but what we did today rushing through things was more vibe coding than I'd want to do
definitely. Um, but like I hope that like I explain things well enough like when you'd want to dive in deeper so
that you understand how to not vibe code as well. So it's like let's go through things quick, but I'll speak to like
when you'd want to slow down. I hope that makes sense. And so we definitely could be making this a lot better if we
put more time into it. But yeah, I mean it's we've got something working here.
It's um yeah, just like I mean there's requirements that we weren't clear on. Like another thing is like I feel like I
need to specify a directory. Like why is there no place to say here's the folder for you to operate in? Like I think
that's a problem as well. But also like if I was really meticulous in reading through the requirements and the spec
and the brief like I would have caught that like oh it's missing that like let me add that in or tell it to and like
those are the kind of things that you'd want to validate where like clearly I just wasn't clear enough on like what parameters I need here or maybe I could
be more clear on like how that connection is set up with websockets and like there's probably something in in
the in the PRD where if I really read through it I'd understand like okay this is the missing piece that it has to make
it so that like we're not actually getting the logs here um from the coding assistant. So yeah, all that to say
there's a lot of ways that we could have made this process better, but we got something started and also I think this was a good demo of how to use archon
with BMAD. So yeah. All right.
Yeah, I know you aren't a big fan of vibe coding. When done with love and care and using the right ingredients and experience, almost anyone could get that
dopamine hit of instant results. Well, yeah, that's very true. I mean, vibe coding is fantastic for proof of
concepts and like just diving more straight into implementation kind of like what I did today um to an extent
like there's a time and place for that. But when you really want the best output possible and actually when you do want
to develop something that's like really production ready the fastest, it is worth spending a lot of time up front
with your context engineering. And that's one of the big things that I I've really been pushing recently u because I just think it is so important.
So yeah. All right. I'm going to go ahead and move to the um
and let me clear this. All right. All right. So, yeah, I think I'm going
to go ahead and wrap up the stream now. I've been talking for three hours straight, and I think I'm going to take uh most of the day off and and get that
recap uploaded tomorrow. And uh I'll um I'm going to be super active in Dynamis
tomorrow as well. And then going into next week, well, I mean, I always am, but uh yeah, I know that I already heard
from my wife that there's influx of people joining Dynamis, which I appreciate a lot, guys, because we're going to be doing some amazing things
together. So, yeah. All right. Um, I'm going to eat some lunch, too. Right.
Yeah. I have not been drinking any water. I have I have my water here specifically so I could drink,
but I I never remember to do that while I'm in a live stream. I always forget.
There was one live stream a couple ago that I did. I actually gave myself co
like I brought coffee to the live stream and I remember holding it up at the start of the of the live stream. I'm like, "Here's my NN mug. I got coffee
because we got a a a chill casual live stream today and I'm going to be sipping my coffee and then I sipped it once the
entire live stream because I totally forgot about it because I get so into it. Like you guys have no idea how much
it takes like mental effort to be like watching the chat, watching my stream and like kind of checking on viewership
and then like diving into Claude Code or whatever and and like it's a lot but it's really fun. Like it's so worth it.
So yeah, thank you everyone for being here and being a part of Archon. Um, as you can see, like not perfect right now,
but it's freaking awesome and there's so much more that we got coming really soon for it and a really amazing long-term
vision. So, yeah, definitely check out Dynamus if you guys want to be a really big part of it. Um, but also like it's
totally public open source project and we got a public community as well. So, yeah, options either way for you guys,
but big things coming for Archon short and long term. So, thank you everyone
for being here and following along and your questions and comments. Hope that you guys have a great rest of your
weekend. And with that, I will see you guys in the next video.