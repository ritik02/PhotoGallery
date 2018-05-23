This is a PhotoGallery Web Application implemented on Ruby on Rails.

OVERVIEW

This is a PhotoGallery web application implemented on Ruby on Rails in which anyone can post photos and view photos present in the database . The photos are divide according to various categories like - Nature , Space, Car , Bike , Monument etc. Not only can the viewer view all the photos at once but also view them category-wise . Each photo will consist of -

Image

Title

Category, and

Name of user who posted it.

-------------------------------------------xx

STEPS TO FOLLOW -

 1) Download or Clone the Repository.
 2) Move to the Project folder where it was download and do "cd" into it.
 3) Now run following commands -
	"bundle install" ,

	"rails active_storage:install",

	"rake db:migrate",

	"rails server",

 4) Now open your web browser and go to "http://localhost:3000" .

--------------------------------------------xx

BASIC FUNCTIONING -

It will consist of a home page showing the description of the site and it will show all the Images (and other information) stored in the database.

The user can click on each of the Image Title to view it in a separate page  for enlarged view and see who posted it and also its category. It also gives the option to Delete a photo or Edit the information about it.
Delete option gives a prompt for deletion too and then redirect to home page with a message “You Photo has been removed” .
On clicking edit option , the user is shown a form on for editing details of the photos and on clicking on “Edit Post” button the user is redirected to the Photo Post page showing his edited Post with a message “You Post has been deleted” .

Clicking on the Category allows the user to view all the photos of that particular category .

The home page will also consist of an option “View by categories” which will redirect to a new page showing all the categories available and by clicking on any category the user can view each of the images of that particular category .

Home page also consists of “Add a new Photo” option which redirects the user to a form to create a Photo Post by entering the details and submitting them by clicking on Submit button . This will add a photo in the database and redirect to the home page with a message “Your Photo had been saved to the Gallery” .

Each of the pages would also include a “Back” button for moving to the previous page.

Also the website consist of an “About” Page which can be viewed by clicking on About button on homepage .

Have fun Enjoy !!
