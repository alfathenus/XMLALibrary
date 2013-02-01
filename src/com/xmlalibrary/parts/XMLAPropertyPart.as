package com.xmlalibrary.parts
{
	import com.xmlalibrary.constants.XMLAFunctions;
	import com.xmlalibrary.context.properties.DiscoverPropertyContext;
	import com.xmlalibrary.context.properties.ExecutePropertyContext;
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	import com.xmlalibrary.interfaces.IXMLAPropertyPart;
	
	public class XMLAPropertyPart extends XMLAPart implements IXMLAPropertyPart
	{
		//-------------------------------
		// Variables
		//-------------------------------
		private var _functionType:String;
		
		//-------------------------------
		// Constructor
		//-------------------------------
		/**
		 * Constructor
		 */
		public function XMLAPropertyPart()
		{
			super();
		}
		
		//-------------------------------
		// Getters and Setters
		//-------------------------------
		/**
		 * @inheritDoc
		 */
		public function get functionType():String
		{
			return this._functionType;
		}
		
		public function set functionType(value:String):void
		{
			this._functionType = value;
			switch ( value ) {
				case XMLAFunctions.DISCOVER:
					this.context = new DiscoverPropertyContext();
					break;
				case XMLAFunctions.EXECUTE:
					this.context = new ExecutePropertyContext();
					break;
				default:
					this.context = null;
			}
		}
	}
}