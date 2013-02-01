package com.xmlalibrary.interfaces
{
	public interface IXMLAContextPart
	{
		/**
		 * Gets how depht is the node that we need to add de values.
		 */
		function get nodeDepth():int;
		
		/**
		 * Indicate if is necesary the root node or not.
		 */
		function useRootNode():Boolean;
		
		/**
		 * Properties list that de context accept.
		 */
		function acceptProperties():Array;
		
		/**
		 * Template for the part.
		 */
		function template():XML;
		
		/**
		 * Validate if a property can be added in this context.
		 */
		function validate(name:String):Boolean;
	}
}