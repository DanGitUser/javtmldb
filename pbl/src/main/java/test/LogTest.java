package test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.core.ConsoleAppender;

public class LogTest { 

	private static final Logger logger = LoggerFactory.getLogger(LogTest.class);
	public static void main(String[] args) {
			logger.debug("Debug");
			logger.info("Info log");
			logger.warn("warn log");
			logger.error("error log");
			
//			ConsoleAppender<E> STD 
		// There exists a loglevel for logs (level of logs)
	}
}
