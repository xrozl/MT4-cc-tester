void OnTick() {
   static datetime prev_time = Time[0];
   
   if(Time[0] == prev_time) {
      return;
   }
   
   prev_time = Time[0];

   string cookie=NULL, headers;
   char   post[], result[];
   string format = "http://localhost:8080/ontick?symbol=%s&time=%s&open=%f&high=%f&low=%f&close=%f";
   string request = StringFormat(format, Symbol(), TimeToStr(Time[0] , TIME_DATE | TIME_SECONDS), Open[0], High[0], Low[0], Close[0]);

   int response = WebRequest("GET", request, cookie, NULL, 500, post, 0, result, headers);
   if (response == -1) {
     Print("Error in WebRequest. Error code  =",GetLastError());
   } else {
      if (response == 200) {
         Print("Return from python: " + CharArrayToString(result));
      } else {
         PrintFormat("Request '%s' failed, error code %d", url, response);
      }
    }
}
