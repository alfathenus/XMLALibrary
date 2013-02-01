package com.xmlalibrary.context.restrictions
{
	import com.xmlalibrary.context.BaseRestrictionsContext;
	
	/**
	 *
	 * Define the values that can be accept the Cube discover.n.
	 * 
	 * Posible restrictions (http://msdn.microsoft.com/en-us/library/ms126180.aspx)
	 * 
	 * CATALOG_NAME				-> Implemented
	 * SCHEMA_NAME					-> Implemented
	 * CUBE_NAME					-> Implemented
	 * DIMENSION_NAME				-> Implemented
	 * DIMENSION_UNIQUE_NAME		-> Implemented
	 * CUBE_SOURCE					-> Not Implemented
	 * DIMENSION_VISIBILITY		-> Not Implemented
	 * 
	 */
	public class DimensionRestrictionContext extends BaseRestrictionsContext
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
		/**
		 * @TODO documentar
		 */
		static public const DIMENSION_NAME:String="DIMENSION_NAME";
		/**
		 * @TODO documentar
		 */
		static public const DIMENSION_UNIQUE_NAME:String="DIMENSION_UNIQUE_NAME";
		/**
		 * @TODO documentar
		 */
		static public const CUBE_SOURCE:String = "CUBE_SOURCE";
		/**
		 * @TODO documentar
		 */
		static public const DIMENSION_VISIBILITY:String = "DIMENSION_VISIBILITY";
		
		//----------------------------------
		// Constructor
		//----------------------------------
		public function DimensionRestrictionContext()
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
			return [CATALOG_NAME, SCHEMA_NAME, CUBE_NAME, DIMENSION_NAME, DIMENSION_UNIQUE_NAME, CUBE_SOURCE, DIMENSION_VISIBILITY];
		}
	}
}