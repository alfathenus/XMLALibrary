package com.xmlalibrary.context
{

	/**
	 * Base class for all properties context parts.
	 */
	public class BasePropertyContext extends AbstractContext
	{
		//-------------------------------------
		// Constructor
		//-------------------------------------
		/**
		 * Constructor
		 */
		public function BasePropertyContext()
		{
		}
		
		//-------------------------------------
		// Public methods
		//-------------------------------------
		/**
		 * @inheritDoc
		 */
		override public function template():XML
		{
			return <Properties><PropertyList></PropertyList></Properties>;
		}
	}
}