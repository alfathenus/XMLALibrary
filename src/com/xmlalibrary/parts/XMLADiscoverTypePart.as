package com.xmlalibrary.parts
{
	import com.xmlalibrary.context.discovertype.DiscoverTypeContext;
	import com.xmlalibrary.context.properties.DiscoverPropertyContext;
	import com.xmlalibrary.interfaces.IXMLADiscoverTypePart;
	
	import flash.utils.Dictionary;

	public class XMLADiscoverTypePart extends XMLAPart implements IXMLADiscoverTypePart
	{
		//-------------------------------
		// Constructor
		//-------------------------------
		/**
		 * Constructor
		 */
		public function XMLADiscoverTypePart()
		{
			super();
			this.initXMLADiscoverTypePart();
		}
		
		//-------------------------------
		// Getters and Setters
		//-------------------------------
		/**
		 * @inheritDoc
		 */
		public function get type():String {
			var p:Dictionary = this.propertyList;
			if ( p != null && p.hasOwnProperty(DiscoverTypeContext.REQUEST_TYPE) ) {
				return p[DiscoverTypeContext.REQUEST_TYPE];
			}
			return null;
		}
		
		public function set type(value:String):void {
			this.add(DiscoverTypeContext.REQUEST_TYPE, value);
		}
		
		
		//-------------------------------
		// Private methods
		//-------------------------------
		private function initXMLADiscoverTypePart():void {
			this.context = new DiscoverTypeContext();
		}
	}
}