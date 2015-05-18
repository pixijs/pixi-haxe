/**!
 * name: pixi.TextInput.js
 * repository: https://gist.github.com/Fishrock123/7ce7da8cacd762a56542
 * @author Jeremiah Senkpiel - https://searchbeam.jit.su
 * @version 0.2
 * MIT Licensed - Copyright 2013 Jeremiah Senkpiel
 */

(function(){

	PIXI.TextInput = function(style, options)
	{
		options = options || {};
		PIXI.Text.call(this, options.placeholder || 'TextInput', style);

		this.maxLength = options.maxLength || 256;
		this.listening = options.listening || false;

		var input = document.getElementById("canvas");
		input.contentEditable = true;
		input.addEventListener('input', this.keyInput);
	};

	// constructor
	PIXI.TextInput.prototype = Object.create(PIXI.Text.prototype);
	PIXI.TextInput.prototype.constructor = PIXI.TextInput;

	PIXI.TextInput.prototype.add = function(ch)
	{
		if (this.text.length < this.maxLength) this.text = this.text + ch;
	};

	PIXI.TextInput.prototype.backspace = function()
	{
		this.text = this.text.slice(0, -1);
	};

	PIXI.TextInput.prototype.keyInput = function(e)
	{
		if (!listening) return;
		e = e || window.event;

		if (typeof evt.which == "number" && evt.which > 0 && !e.ctrlKey && !e.metaKey && !e.altKey) {
			if (e.data.stage instanceof PIXI.Container && e.data.stage.interactionManager.mouse.target === e.data) {
				e.preventDefault();
				e.stopPropagation();
				if (e.which === 8) {
					e.data.backspace();
				} else {
					e.data.add(this.getChar(e));
				}
			}
		}
	};

	/**!
	 * The following function is a slightly modified version of jQuery.getChar
	 *
	 * name: jQuery getChar
	 * repository: https://github.com/bpeacock/key-to-charCode
	 * @author Brian Peacock
	 * @version 0.3 [Modified]
	 * Copyright 2013, Brian Peacock
	 * Licensed under the MIT license.
	 */
	PIXI.TextInput.prototype.getChar = function(e)
	{
		/*** Convert to Char Code ***/
		var code = e.which
			, ch = ''
			, ignoredCodes = { //Ignore Shift Key events & arrows
				16: true,
				37: true,
				38: true,
				39: true,
				40: true,
				20: true,
				17: true,
				18: true,
				91: true
			}
			, exceptions = { //These are special cases that don't fit the ASCII mapping
				186: 59, // ;
				187: 61, // =
				188: 44, // ,
				189: 45, // -
				190: 46, // .
				191: 47, // /
				192: 96, // `
				219: 91, // [
				220: 92, // \
				221: 93, // ]
				222: 39  // '
			}
			, special = { //Shift-key characters
				1: '!',
				2: '@',
				3: '#',
				4: '$',
				5: '%',
				6: '^',
				7: '&',
				8: '*',
				9: '(',
				0: ')',
				',': '<',
				'.': '>',
				'/': '?',
				';': ':',
				"'": '"',
				'[': '{',
				']': '}',
				'\\': '|',
				'`': '~',
				'-': '_',
				'=': '+'
			};

		if (ignoredCodes[code] === true) {
			return false;
		}

		if (typeof exceptions[code] != 'undefined') {
			code = exceptions[code];
		}

		ch = String.fromCharCode(code);

		/*** Handle Shift ***/
		if (e.shiftKey) {
			if (typeof special[ch] != 'undefined') {
				ch = special[ch];
			}
		} else {
			ch = ch.toLowerCase();
		}

		return ch;
	};

}).call(this);