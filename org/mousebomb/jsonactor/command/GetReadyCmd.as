package org.mousebomb.jsonactor.command
{
	import org.mousebomb.jsonactor.ActorConfig;
	import org.mousebomb.jsonactor.model.ErrorCodeModel;
	import org.mousebomb.jsonactor.model.TimeModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * 使框架就绪
	 * @author mousebomb mousebomb@gmail.com
	 * created: 2012-11-5 
	 * last modified: 2012-11-5
	 */
	public class GetReadyCmd extends Command
	{
		public function GetReadyCmd()
		{
		}

		[Inject]
		public var timeModel : TimeModel;
		[Inject]
		public var errorModel:ErrorCodeModel;

		override public function execute() : void
		{
			timeModel.validTime();
			errorModel.getErrorList(ActorConfig.lang);
			
		}
	}
}
