(in-package :cl-wt)

(defclass WAPPLICATIONJQM (WAPPLICATION)
  nil)

(defmethod style-imports ((app WAPPLICATIONJQM))
  "<link rel='stylesheet' href='http://code.jquery.com/mobile/1.4.3/jquery.mobile-1.4.3.min.css' />
   <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700'>")

(defmethod script-imports ((app WAPPLICATIONJQM))
  "<script src='http://code.jquery.com/jquery-1.11.1.min.js'></script>
   <script src='http://code.jquery.com/mobile/1.4.3/jquery.mobile-1.4.3.min.js'></script>
   <script> 
      $(document).bind('mobileinit', function(){
         $.mobile.ajaxEnabled = false;
         $.mobile.loadingMessage = 'Loading';
         $.mobile.defaultDialogTransition = 'none';
         $.mobile.defaultPageTransition = 'none';
         $.mobile.pageLoadErrorMessage = 'Error in loading';
      });
   </script>")



