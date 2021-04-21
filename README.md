<h1> SimpleMindfulness</h1>

SimpleMindfulness is an IOS application made with Swift. I created it as a way to exercise my application development, object oriented programming, and front end development skills, all while hopefully making a tool that someone could actually use in their day to day life.

<h2>What is this application?</h2>

SimpleMindfulness is a mindfulness application that is meant to help people develop their "emotional toolbox". These are common tasks that they can do on an everyday basis to help when dealing with negative emotions. They idea is that the user will be able to supply lists of things that help them when they are experience common negative emotions, such as anxiety, depression etc. They application will store this lists and the user can log how they are feeling at any given time. In response to a logged emotion the application will present suggestions that the user entered to help them cope with how they are feeling. The user can then rate how helpful the suggestion is and the application will store when the user logged their emotion, what was suggested to help them, and how much it helped them. Users can then refer back to this data later to look for trends like mood patterns, as well as what suggestions are actually most helpful for them.

<h2> What was this application made with?</h2>

This application was coded in Swift, the front end was developed using SwiftUI. The user logs are stored using CoreData, suggestions are stored using PLists, and user settings are stored using UserDefaults.

<h2> Current Application Status </h2>

- [X] Designed and implemented frontend of the main view, suggestion view, and settings view
- [X] Added ability for user to store and retrieve their own custom suggestions using PLists
- [X] Users can now log emotions after which the application will present saved suggestions for them
- [X] Users can opt out of data logging in order to use the app solely as a way to store suggestions and retrieve suggestions
- [X] Added privacy policy and users ability to view and accept privacy policy
- [X] added settings screen where the user can remove acceptance of privacy policy as well as enter basic user information
- [ ] Add ability for the user to review Date and Times of logged emotions
- [ ] Add ability for user to rate how much a particular suggestion helped them
- [ ] Add ability for user to review a log of how much particular suggestions have helped them
