Welcome to our application Music Elephant. 

This is a music theory learning application with test your knowledge quizzes and revision sessions. 
The application was inspired by Ewan who realised there are easier methods of teaching and learning music theory, when talking through the initial idea it became apparent that there is a gap in the market for educational apps to teach this subject.
Ewan reached out to Shuna, Nick and Michael to form the group where we bgan to plan, design and build this application.

The application uses a varied tech stack, which includes:
  - Java: The back end code, which builds the lessons, quiz, questions and user classes.
  - Postgres: This is the primary databse used to store all details for the above classes.
  - Spring: The framework used in conjunction with Java to connect our database with our back end. 
  - Dart: The primary language used to build our front end.
  - Flutter: The Framework used with Dart to assist with the design of our front end.

In order to run the application you'll need to start by creating an empty database called music_elephant in your terminal
createdb music_elephant

Once the database has been created open the server files and run the application so the data loader can populate the database. 
we used intelliJ which allows you to run the application.

Now that you have a populated database we can open the front end application, we used VScode. VScode does provide a virtual display
to display the application once running, however to help us develop the application we used Xcode which comes with a virtual MacOs simulator
covering a number of different devices. 
you can either run the application from VScode or open the simulator that comes with Xcode and then run the application in VScode. 



The application opens to our users page, here we can select the user we wish to continue with.
-
-
-
Once we have selected a user, we are presented with the users profile page, here we can continue to their learning page and either
edit and/or delete the user. 
(The statistics are currently a placeholder image, this is something that we wanted to work on however due to the time constraints at
the time of development we didn't quite get to completion of this element.)
-
-
-
Now that we're onto the learning page, we have our map of lessons and quizzes. 
-
-
-
Here we can see that we have a collection of different difficulty levels, Beginner, Intermediate and Expert. you can only progress onto the next difficulty once all the lesson quizzes and level end quiz have been completed.
-
-
-
Going into the first quiz here, we have a collection of different question types, fill in the blank, identify and click and drag.
-
-
-

We were able to implement the ability to only allow the correct number of answers for the multipls choice questions, here there are 2 answers and you can see we can't select more than 2. 
-
-
-
We've also added the capacity to unselect an answer if you belive the selection to be incorrect.
-
-
-
Once completing a quiz succesfully you can see a star is filled in the progress stars. Once a quiz has been completed a new difficulty quiz will be unlocked.
-
-
-
To unlick the next section all quizes need to be completed for each lesson and the trest your knowledge quiz needs to pass.
-
-
-


