package org.mousebomb.jsonactor.model
{
	import org.mousebomb.jsonactor.gateway.GatewayCaller;

	import flash.utils.Dictionary;

	/**
	 * @author Mousebomb
	 */
	public class ErrorCodeModel extends GatewayCaller
	{
		public function ErrorCodeModel()
		{
		}

		public function getErrorList(lang : String) : void
		{
			call("utils/error-list", {lang:lang}, onGetErrorList);
		}

		public static var errorList : Dictionary;

		private function onGetErrorList(result : Object) : void
		{
			errorList = new Dictionary();
			for  each (var li : Object in result)
			{
				errorList[li.errId] = li.msg;
			}
			dispatch(new UtilsEvent(UtilsEvent.ERROR_LIST_UPDATED));
		}
	}
}
