// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function(){

	$('.destroy').on('click', function(){
		$.ajax({
			url: '/articles/'+this.parentElement.id,
			type: 'DELETE',
			success: function(r){ 
				alert("Article deleted");
				console.log(r.message);
			},
			error: function(r){}

		});
	});
});
import "trix"
import "@rails/actiontext"
