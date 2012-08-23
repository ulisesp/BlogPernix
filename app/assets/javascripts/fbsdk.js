window.fbAsyncInit = function() {
          FB.init({
            appId      : '276339339133656', // App ID
            status     : true, // check login status
            cookie     : true, // enable cookies to allow the server to access the session
            xfbml      : true,  // parse XFBML
            oath       : true,
            logging    : true,
            channelUrl : '//http://fast-wave-7497.herokuapp.com/channel.html'
          });
          // Additional initialization code here

          FB.Event.subscribe('auth.statusChange', function(response) {
           alert('The status of the session is: ' + response.status);
          });
        };
        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));
