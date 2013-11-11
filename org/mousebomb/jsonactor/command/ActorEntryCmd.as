package org.mousebomb.jsonactor.command {
	import org.mousebomb.jsonactor.gateway.GatewayConf;
	import org.mousebomb.jsonactor.model.ErrorCodeModel;
	import org.mousebomb.jsonactor.model.TimeModel;
	import org.mousebomb.jsonactor.model.UtilsEvent;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Mousebomb
	 */
	public class ActorEntryCmd extends Command {
		public function ActorEntryCmd() {
		}

		/**
		 * OVERRIDE ME 
		 * 
		 * 必须调用GatewayConf.initGatewayHost("http://localhost:81/");
		 * 必须事后super.execute();
		 */
		override public function execute() : void {
			//
			// MODEL
			injector.mapSingleton(TimeModel);
			injector.mapSingleton(ErrorCodeModel);

			//
			getReady();
		}

		private function getReady() : void {
			// 做准备工作
			commandMap.mapEvent(UtilsEvent.ERROR_LIST_UPDATED, CheckReadyCmd);
			commandMap.mapEvent(UtilsEvent.TIME_VALIDATED, CheckReadyCmd);
			commandMap.execute(GetReadyCmd);
		}
	}
}
