package com.xmlalibrary.context.restrictions
{
	import com.xmlalibrary.context.BaseRestrictionsContext;
	
	/**
	 * Define the values that can be accept the Cube discover.
	 */
	public class CubeRestrictionContext extends BaseRestrictionsContext
	{
		//-------------------------------------------
		// Constant
		//-------------------------------------------
		/**
		 * @TODO documentar
		 */
		static public const CATALOG_NAME:String="CATALOG_NAME";
		/**
		 * @TODO documentar
		 */
		static public const SCHEMA_NAME:String="SCHEMA_NAME";
		/**
		 * @TODO documentar
		 */
		static public const CUBE_NAME:String="CUBE_NAME";
		
		//----------------------------------
		// Constructor
		//----------------------------------
		/**
		 * Constructor
		 */
		public function CubeRestrictionContext()
		{
			super();
		}
		
		//----------------------------------
		// Public methods
		//----------------------------------
		/**
		 * @inheritDoc
		 */
		override public function acceptProperties():Array {
			return [CATALOG_NAME, SCHEMA_NAME, CUBE_NAME];
		}
	}
}