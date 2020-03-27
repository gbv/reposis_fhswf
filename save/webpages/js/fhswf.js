
$(document).ready(function() {

  // spam protection for mails
  $('span.madress').each(function(i) {
      var text = $(this).text();
      var address = text.replace(" [at] ", "@");
      $(this).after('<a href="mailto:'+address+'">'+ address +'</a>')
      $(this).remove();
  });

  // add login link if access is denied
  $("div.alert-warning:contains('nur angemeldete Nutzer')").replaceWith(function () { 
      return $('<div role="alert" class="alert alert-warning"><strong>Zugriffsberechtigung</strong>&nbsp;<a href="https://publikationen.fhb.fh-swf.de/servlets/MCRLoginServlet">nur angemeldete Nutzer</a></div>');
  });

  
});