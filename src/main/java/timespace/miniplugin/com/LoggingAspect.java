package timespace.miniplugin.com;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import egovframework.let.cop.bbs.service.Board;
@Component
public class LoggingAspect {
	//private Logger log = LoggerFactory.getLogger(getClass());

	// getLogging 포인트컷
	public void getLogging() {}
	// 매개변수 포인트 컷
	public void updateLogging(Board board) {}
	// before 어드바이스
	public void logBefore(JoinPoint joinpoint) {
		String message = buildJoinpoint(joinpoint);
		message += "메서드 실행 시작";
		//log.info(message);
		System.out.println(message);
	}
	// after 어드바이스 
	public void logAfter(JoinPoint joinpoint) {
		String message = buildJoinpoint(joinpoint);
		message += "메서드 실행 공통 종료";
		//log.info(message);
		System.out.println(message);
	}
	//after-returning 어드바이스 
	public void logAfterReturning(JoinPoint joinpoint) {
		String message = buildJoinpoint(joinpoint);
		message += "메서드 실행 정상 종료";
		//log.info(message);
		System.out.println(message);
	}
	// after-throwing 어드바이스 
	public void logAfterThrowing(JoinPoint joinpoint) {
		String message = buildJoinpoint(joinpoint);
		message += "메서드 실행 에러";
		//log.info(message);
		System.out.println(message);
	}
	// around 어드바이스 
	public void logAround(ProceedingJoinPoint joinpoint) throws Throwable {
		long start = System.currentTimeMillis();
		//log.info("===========  시작 ===========");
		System.out.println("===========  시작 ===========");
		String message = buildJoinpoint(joinpoint);
		message += "메서드 실행 시작";
		//log.info(message);
		System.out.println(message);
		joinpoint.proceed();		// 메서드 호출 
		message = buildJoinpoint(joinpoint);
		message += "메서드 실행 종료";
		long end = System.currentTimeMillis();
		long duration = end - start;
		//log.info("실행 시간 : " + duration + " 밀리초");
		//log.info("===========  종료 ===========");
		System.out.println("실행 시간 : " + duration + " 밀리초");
		System.out.println("===========  종료 ===========");
	}
	
	public void logBeforeUpdate(JoinPoint joinpoint, Board board) {
		String message = buildJoinpoint(joinpoint);
		message += "메서드 실행 시작";
		//log.info(message);
		//log.info("변경 정보 : " + board.getNtcrId() + ", " + board.getNtcrNm() + ", " + board.getNttCn());
		System.out.println(message);
		System.out.println("변경 정보 : " + board.getNtcrId() + ", " + board.getNtcrNm() + ", " + board.getNttCn());
	}

	private String buildJoinpoint(JoinPoint joinpoint) {
		String className = joinpoint.getTarget().getClass().getName();
		String methodName = joinpoint.getSignature().getName();
		String message = className + " 클래스의 " + methodName + "( ";
		Object [] args = joinpoint.getArgs();
		for(int i = 0; i < args.length; ++i){
			Object arg  = args[i];
			message += arg.getClass().getTypeName();
			if(i != args.length - 1 )
				message += ", ";
		}
		message += " ) ";
		return message;
	}
}
