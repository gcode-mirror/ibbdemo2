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

package
{
	// Attempt to write a wrapper to stand in for the console object
	// Hang it off the document's window object and the js calls will get routed in here...
	public class ShaunConsole
	{
		public function ShaunConsole()
		{
		}

		public function log(s:Object):void
		{
			//trace(s);
		}
		
		
		public function hasConsole():Boolean
		{
			return(false);	
		}
		
		
		public function debug():void 
		{
		
		}
		
		public function info():void 
		{
		
		}
		
		public function warn():void 
		{
		
		}  			
		
		public function error():void 
		{
		
		}
		
		public function assert():void {}			
		public function dirxml():void {}
		public function trace(s:Object):void {}			
		public function group():void {}
		public function groupEnd	():void {}		
		public function time():void {}
		public function timeEnd():void {}			
		public function dir():void {}
		public function profile():void {}
		public function profileEnd():void {}
		public function count():void {}
				
		
	}
	
}