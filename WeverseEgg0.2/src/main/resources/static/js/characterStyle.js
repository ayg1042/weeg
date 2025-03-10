/**
 * 
 */

$(document).ready(function () {
	let frame = $('#photo_frame').attr('class');
	let plant = $('#plant').attr('class');
	let sofa = $('#sofa').attr('class');
	let shelf = $('#shelf').attr('class');
	let carpet = $('#carpet').attr('class');
	let pet = $('#pet').attr('class');
	
	let hat = $('.clothing.hat').attr('id');
	let dress = $('.clothing.dress').attr('id');
	
	$('#photo_frame').css('background-image', frame === '' ? 'none' : 'url("/images/items/interior/' + frame + '")');
	$('#plant').css('background-image', plant === '' ? 'none' : 'url("/images/items/interior/' + plant + '")');
	$('#sofa').css('background-image', sofa === '' ? 'none' : 'url("/images/items/interior/' + sofa + '")');
	$('#shelf').css('background-image', shelf === '' ? 'none' : 'url("/images/items/interior/' + shelf + '")');
	$('#carpet').css('background-image', carpet === '' ? 'none' : 'url("/images/items/interior/' + carpet + '")');
	$('#pet').css('background-image', pet === '' ? 'none' : 'url("/images/items/pet/' + pet + '")');
	
	$('.clothing.hat').css('background-image', hat === '' ? 'none' : 'url("/images/items/hat/' + hat + '")');
	$('.clothing.dress').css('background-image', dress === '' ? 'none' : 'url("/images/items/outfit/' + dress + '")');
	
	
})