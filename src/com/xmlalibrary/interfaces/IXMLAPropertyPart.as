package com.xmlalibrary.interfaces
{
	public interface IXMLAPropertyPart extends IXMLAPart
	{
		/**
		 * Set the function type.
		 * 
		 * @see com.xmlalibrary.XMLAConstants;
		 */
		function get functionType():String;
		function set functionType(value:String):void;
	}
}