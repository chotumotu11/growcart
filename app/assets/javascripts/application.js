// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require_tree

$("document").ready(function() {
	$(".auto-update").on("change",function(){
		$.ajax({
			url: "/subcategories",
			type: "GET",
			data: {"cat_id": $(this).val()},
			dataType: "JSON",
			success: successFN,
			error: errorFN
		});

		function successFN(result){
			$(".sub-update").find('option').remove();
			$(".sub-update").append('<option value>Select Subcategories</option>');
			$(".brand").find('option').remove();
			$(".brand").append('<option value>Select brand</option>');
			for(var i=0 ; i < result.length ;i++){
				var value = result[i]["id"];
				var text = result[i]["name"];
				console.log(value + " and " + text);
				$(".sub-update").append('<option value='+ value + '>'+ text + '</option>');
			}

		}

		function errorFN(xhr, status , strErr){
			console.log("Error Occured");
		} 
	});

		$(".sub-update").on("change",function(){
		$.ajax({
			url: "/brands",
			type: "GET",
			data: {"cat_id": $(this).val()},
			dataType: "JSON",
			success: successFN,
			error: errorFN
		});

		function successFN(result){
			$(".brand").find('option').remove();
			$(".brand").append('<option value>Select brand</option>');
			for(var i=0 ; i < result.length ;i++){
				var value = result[i]["id"];
				var text = result[i]["name"];
				console.log(value + " and " + text);
				$(".brand").append('<option value='+ value + '>'+ text + '</option>');
			}

		}

		function errorFN(xhr, status , strErr){
			console.log(xhr);
		} 
	});

});