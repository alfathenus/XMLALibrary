package com.xmlalibrary.interfaces
{
	import flash.utils.Dictionary;
	
	import mx.core.INavigatorContent;

	/**
	 * Define a part for XMLA function
	 */
	public interface IXMLAPart
	{
		//---------------------------------
		// Getters and Setters
		//---------------------------------
		/**
		 * Set the context of the part that we are creating.
		 * 
		 * @param context 		Set de reference to the context.
		 * 
		 * @see com.xmlalibrary.interfaces.IXMLAContextPart
		 */
		function get context():IXMLAContextPart;
		function set context(value:IXMLAContextPart):void;
		
		/**
		 * how many properties were setted.
		 */
		function get propertiesCount():int;
		
		/**
		 * Get all properties that been added.
		 */
		function get propertyList():Dictionary;
		//---------------------------------
		// Public methods
		//---------------------------------
		/**
		 * Add a new value on the part.
		 * 
		 * @param name			The name of the property defined for the context.
		 * @param value			The value of the property.
		 */
		function add(name:String, value:String):void;
		
		/**
		 * Remove a property.
		 */
		function rem(name:String):void;
		
		/**
		 * Clear all properties/values that we added.
		 */
		function clear():void;
		
		/**
		 * Create a part.
		 */
		function generate():XML;
	}
}