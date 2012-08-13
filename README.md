# SocialIcons

This is a simple plugin to help you display some social icons in your site.

Icons supported so far:

- Facebook like button
- Facebook
- Twitter
- Delicious
- Reddit
- Digg
- Youtube (and many more...)

## CSS files

* social_icons_aqua
* social_icons_aqua_all
* social_icons_default_16
* social_icons_default_20
* social_icons_default_24
* social_icons_default_48
* social_icons_default_60

## Adding custom sprite icon sets

The sprites and CSS files were generated using [spritegen](http://spritegen.website-performance.org/)

See the 'pictos-icons' and 'world-flags' gems for more examples and tools to generate your own sprite customization, including: grayscaling, lighten/darken icons etc.

## Installation and usage

This gem is a Rails 3 engine and the asset folder will therefore be included in the Rails asset pipeline when the gem is included in your Rails 3 project (add to Gemfile).

Simply require the social_icons `css` files in your `application.css` manifest file.

```css
/*
 *= require social_icons_aqua
 *= require social_icons_default_24
 *= require social_icons_default_60
*/
```

If you are using SCSS and Compass use `@imports`, fx:

```scss
@import 'bourbon';
@import 'compass';

@import 'social_icons_aqua';
@import 'social_icons_default_60';
```

## Using Aqua sprite

Wrap with an element of class="social"

```html
<ul class="s16 aqua">
	<li class="social google"></li>
</ul> 
```

## Using Default sprite

```html
<ul class="s48">
	<li class="social google"></li>
</ul> 

<ul class="s48 aqua">
	<li class="social google"></li>
</ul> 
```

## View Helper methods

Call "print_social_icons" method in your partials or views.

```erb
<%= print_social_icons %>

<%= print_social_icons :icon_set => 'default', :size => 20 %>
```

Specific icon methods:

* facebook_like_button
* social_icon_twitter
* social_icon_facebook
* social_icon_digg
* social_icon_delicious
* social_icon_reddit

See `lib/social_icons/view_helpers.rb` for details ;)

