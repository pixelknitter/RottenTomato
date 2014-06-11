# RottenTomatoes App

This is an iOS demo application for displaying the latest box office movies using the [RottenTomatoes API](http://www.rottentomatoes.com/). See the [RottenTomatoes Networking Tutorial](http://guides.thecodepath.com/ios/RottenTomatoes-Networking-Tutorial) on our cliffnotes for a step-by-step tutorial.

Time spent: 14 hours spent in total

### Completed user stories:

Required:
* [x] User can view a list of movies from Rotten Tomatoes.  Poster images must be loading asynchronously.
* [x] User can view movie details by tapping on a cell
* [x] User sees loading state while waiting for movies API.  You can use one of the 3rd party libraries here.
* [x] User sees error message when there's a networking error.  You may not use UIAlertView to display the error.  See this screenshot for what the error message should look like: [network error screenshot](http://forums.androidcentral.com/attachments/google-nexus-10-tablet/51236d1355614625t-facebook-network-error-no-internet-connection-screenshot_2012-12-15-15-15-05.png).
* [x] User can pull to refresh the movie list.

Optional:
* [ ] All images fade in.
* [ ] For the large poster, load the low-res image first, switch to high-res when complete.
* [ ] All images should be cached in memory and disk. In other words, images load immediately upon cold start.
* [ ] Customize the highlight and selection effect of the cell.
* [ ] Add a tab bar for Box Office and DVD.
* [ ] Add a search bar.

Notes:

Spent some time working on cleaning up my code base and mixing things between programtic UI and XIB UI.

Walkthrough of all user stories:

[Video Walkthrough](https://www.dropbox.com/s/vmw64zsynaew3d0/demo_rotten_tomatoes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).
