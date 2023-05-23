# flutter_application_1

This project uses MVC design pattern with SOC principle (Seperation of concerns). The project has a seperate assets folder outside the lib folder that contains the images/icons folders. 

Secondly, in the lib folder the project has an app folder that contains all of the folders of the app. 

A module folder that contains the two pages of the application. Which inside each folder, the project contains the binding, the controllers, the view folder and the widgets folder for widgets that are only specific to this module.

A services folder which has the translation and delegation services in it. 

A utility folder which contains the constants of the app such as language keys, a UI folder which contains the app's shared widgets, and app tools such as the snackbars and dialoges of the app.


In the Add_sport_event module we have a controller with multiple functions for image picking from gallery using the Image_picker package, a Date and Time picker functions, init function to initialize the defined controllers, and clear one to clear them, while also two functions to add to the list of the sports events and one to edit the details of it.

in the Sport_event_list controller , I had put the sorting method, where I use it in the home page to sort by date and title which uses an enum,a toggle language functions that switches between English and Arabic, and the sendWhatspp function. 

For whatsapp sending function, I have used the url_launcher package instead of Twilio, since I'm more familiar with it. And the way it works is that when I press the Whatsapp icon on a certain item, it opens up the Whatsapp with a pre-made message of the details of the game and the user gets to choose which contacts they would like to send the invitiation for. 




