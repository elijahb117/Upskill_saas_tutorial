/* global $, Stripe */

//Documnent ready.
$(document).on('turbolinks:load', function(){

  //Set Stripe Public key.
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    var theForm = $('#pro_form');
    var signupBtn = $('#form-signup-btn');
  
  //When user clicks form submit btn
  signupBtn.click(function(event){
    //prenvent default submission behavior.
    event.preventDefault();
    //Collect the credit card fields.
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
      
    //Send the card info to Stripe.
    Stripe.createToken({
      number: ccNum,
      cvc: cvcNum,
      exp_month: expMonth,
      exp_year: expYear
    }, stripeResponseHandler); 
    
  });
  
  
  
  //Collect the credit card fields.
  
  //Send the card info to Stripe.
  
  //Stripe will retun a card token.
  
  //Inject card token as hidden field into form.
  
  //Submit form to our Rails app.
  
});