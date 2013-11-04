package org.mousebomb.jsonactor.command
{
	import org.mousebomb.jsonactor.gateway.ActorReadyEvent;
	import org.mousebomb.jsonactor.gateway.GatewayConf;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Mousebomb
	 */
	public class ActorEntryCmd extends Command
	{
		public function ActorEntryCmd()
		{
		}

		override public function execute() : void
		{
//			DateAndTime;

			// MODEL
//			injector.mapSingleton(UserModel);
//			injector.mapSingleton(DoWhatModel);
//			injector.mapSingleton(MsgModel);
//			injector.mapSingleton(TimeModel);

			
			
			GatewayConf.initGatewayHost("http://localhost:81/");
			dispatch(new ActorReadyEvent(ActorReadyEvent.ACTOR_READY));
			// 对时
			commandMap.execute(ValidateTimeCmd);
		}

	}
}
