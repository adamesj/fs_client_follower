// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


(function() {
	function Ticker( element ) {
		this.el = document.getElementById( element );
		this.init();
	}

	Ticker.prototype = {
		init: function() {
			this.items = this.el.getElementsByTagName( "li" );
			this.wrapper = document.getElementById( "ticker-wrapper-inner" );
			this.totalItems = this.items.length;
			this.timer = null;
			this.index = 0;

			this.tick();
			this.hover();

			
		},

		tick: function() {
			var self = this;
			self._setElementOffsets();

			self.timer = setInterval(function() {
				self.index++;

				if( self.index == self.totalItems ) {
					self.index = 0;
				}

				var item = self.items[self.index];
				var top = item.getAttribute( "data-top" );
				self.wrapper.style.top = "-" + top + "px";


			}, 4000 );
		},

		hover: function() {
			var self = this;
			var li = self.items;

			for( var i = 0; i < self.totalItems; ++i ) {
				var item = li[i];
				item.addEventListener( "mouseover", function() {
					clearInterval( self.timer );
					self.timer = null;

				}, false);
				item.addEventListener( "mouseout", function() {
					self.tick();

				}, false);
			}	
		},

		_setElementOffsets: function() {
			var self = this;
			var li = self.items;

			for( var i = 0; i < self.totalItems; ++i ) {
				var item = li[i];
				var top = item.offsetTop;

				item.setAttribute( "data-top", top );
			}
		}
	};

	document.addEventListener( "DOMContentLoaded", function() {
		var news = new Ticker( "ticker" );

	});


})();