#= require vendor/modernizr-custom
#= require vendor/jquery-3.1.0.min.js
#= require vendor/jquery.magnific-popup.min.js

document.onreadystatechange = ->
  if document.readyState == 'interactive'

    unless Modernizr?.svg
      endsWithDotSvg = /.*\.svg$/
      # 1. Find all svg images used on the page
      # 2. Save the current src path
      # 3. Replace svg file extension with png
      imgs = document.getElementsByTagName('img')
      for img in imgs
        if img.src.match(endsWithDotSvg)
          img.src = img.src.replace(/.svg$/, '.png')

$(document).ready ->
  $('.inline-link').magnificPopup({type:'inline'})
  $('.image-link').magnificPopup({type:'image'})

  $('.menu-button, nav#main').click ->
    $('nav#main').toggleClass('active')

$(document).on 'click', 'a.scroll-to', (event) ->
  event.preventDefault()
  $('html, body').animate { scrollTop: $($.attr(this, 'href')).offset().top }, 500

