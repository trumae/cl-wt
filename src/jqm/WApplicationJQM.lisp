(in-package :cl-wt)

(defclass WAPPLICATIONJQM (WAPPLICATION)
  nil)

(defmethod style-imports ((app WAPPLICATIONJQM))
  "<link rel='stylesheet' href='http://code.jquery.com/mobile/1.4.3/jquery.mobile-1.4.3.min.css' />
   <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700'>
   <link rel='stylesheet' href='http://rawgithub.com/arschmitz/jquery-mobile-datepicker-wrapper/v0.1.1/jquery.mobile.datepicker.css'>
   <script src='../js/jquery.js'></script>
")

(defmethod script-imports ((app WAPPLICATIONJQM))
  "<script src='http://code.jquery.com/jquery-1.11.1.min.js'></script>
   <script src='http://code.jquery.com/mobile/1.4.3/jquery.mobile-1.4.3.min.js'></script>
   <script src='http://rawgithub.com/jquery/jquery-ui/1.10.4/ui/jquery.ui.datepicker.js'></script>
   <script id='mobile-datepicker' src='http://rawgithub.com/arschmitz/jquery-mobile-datepicker-wrapper/v0.1.1/jquery.mobile.datepicker.js'></script>
   <script> 
      $(document).bind('mobileinit', function(){
         $.mobile.ajaxEnabled = false;
         $.mobile.loadingMessage = 'Loading';
         $.mobile.defaultDialogTransition = 'none';
         $.mobile.defaultPageTransition = 'none';
         $.mobile.pageLoadErrorMessage = 'Error in loading';
      });
   </script>")



