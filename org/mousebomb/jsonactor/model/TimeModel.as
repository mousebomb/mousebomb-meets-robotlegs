package org.mousebomb.jsonactor.model
{
	import org.mousebomb.jsonactor.gateway.GatewayCaller;
	import org.mousebomb.utils.LogWriter;
	import org.mousebomb.utils.ServerTimeUtils;

	/**
	 * @author Mousebomb
	 */
	public class TimeModel extends GatewayCaller
	{
		public function TimeModel()
		{
		}

		public function validTime() : void
		{
			call("utils/time", {}, onValid);
		}

		private function onValid(result : *) : void
		{
			if (result is Number)
			{
				ServerTimeUtils.setServerTime(result as Number);
				LogWriter.log('对时，时间差: ' + (ServerTimeUtils.offset));
				dispatch(new UtilsEvent(UtilsEvent.TIME_VALIDATED));
			}
		}
	}
}
