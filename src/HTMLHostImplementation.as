/*	


iBBDemo2
Copyright (c) 2010 Shaun Sullivan, Blackbaud

All rights reserved.
shaun.sullivan@blackbaud.com

Open Source License
===================
iBBDemo2 is licensed under the terms of the Open Source GPL 3.0 license. 

http://www.gnu.org/licenses/gpl.html

	
*/


// Note, portions of this file were found in various places on the Web.
// I think the original sample was found at Adobe.com

package 
{ 
	
	import flash.display.NativeWindowInitOptions;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Rectangle;
	import flash.html.HTMLHost;
	import flash.html.HTMLLoader;
	import flash.html.HTMLWindowCreateOptions;
	import flash.net.URLRequest;
	import flash.net.URLRequestDefaults;
	import flash.net.URLRequestHeader;
	
	import mx.utils.Base64Encoder;
	
	public dynamic class HTMLHostImplementation extends HTMLHost 
	{ 
		private var _member:Number = 0;
		private var _locationCallBack:Object;
		private var _console:ShaunConsole = new ShaunConsole();
		
		// We notify the main MXML page when the user navigates via some 
		// other mechanism than our address bar (e.g. they click a link)
		public function setLocationCallBack(o:Object):void
		{
			_locationCallBack = o;
		}
		
		public function getMember():Number
		{
			return(_member);
		}
		
		public function incMember():void
		{
			_member++;
		}
		
		// Attempt to pass a JavaScript Object to AS3
		public function passObject(o:Object):void
		{
			o.foo++;
		}
		
		// Constructor
		public function HTMLHostImplementation(defaultBehaviors:Boolean = true):void
		{ 
			super(defaultBehaviors);
			//htmlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

		} 
		
		override public function updateTitle(title:String):void{ 
			htmlLoader.stage.nativeWindow.title = title + " - New Host"; 
		} 
		
		override public function updateLocation(locationURL:String):void 
		{ 
			//trace("location change");
			_locationCallBack.locationChanged(locationURL);
			
			// Testing communication with host and or page
			_member++;
			
			// TODO: Add some elegant authentication handlers
			// figure out how to get AJAX auth stuff working
			
			//URLRequestDefaults.authenticate = false;
			
			//URLRequestDefaults.setLoginCredentialsForHost("ss.ss.s.s", "xxxx", "xxxx");
			var ur:URLRequest = new URLRequest(locationURL);
				
			//var headerRequests:Array = new Array(1);
			//var encoder64:Base64Encoder = new Base64Encoder();
			//encoder64.encode("admin" + ":" + "admin");
			
			//var credentials:String = encoder64.toString();
			//headerRequests[0] = new URLRequestHeader("Authorization", "Basic " + credentials);
			//ur.requestHeaders = headerRequests;
			
			htmlLoader.addEventListener(Event.COMPLETE, onComplete);
			
			htmlLoader.load(ur);
		}
		
		// When this fires the DOM is ready
		public function onComplete(event:Event):void
		{
			trace("complete");
			// Add custom console implementation			
			htmlLoader.window.console = _console;		
		}
		
		public function ioErrorHandler(event:IOErrorEvent):void
		{
			trace(event.toString());
			
		}
		public function getHTMLLoader():HTMLLoader
		{
			
			return(htmlLoader);
		}
		
	} 

	
}	// Package