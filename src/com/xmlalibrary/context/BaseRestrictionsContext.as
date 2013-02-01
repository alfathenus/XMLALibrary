package com.xmlalibrary.context
{
	import flash.errors.IllegalOperationError;

	/**
	 * Base class for all discover context parts.
	 */
	public class BaseRestrictionsContext extends AbstractContext
	{
		//-------------------------------------
		// Constructor
		//-------------------------------------
		/**
		 * Constructor
		 */
		public function BaseRestrictionsContext()
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
			return <Restrictions><RestrictionList></RestrictionList></Restrictions>;
		}
	}
}