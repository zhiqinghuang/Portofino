import ch.qos.logback.classic.encoder.PatternLayoutEncoder
import ch.qos.logback.core.ConsoleAppender

import static ch.qos.logback.classic.Level.*
import ch.qos.logback.core.FileAppender

def catalinaBase = System.getProperty("catalina.base");
def defaultPattern = "%d{HH:mm:ss.SSS} [userId=%X{userId},userName=%X{userName}] %logger{40} [%F:%L]%n%level: %msg%n";

if(catalinaBase != null) {
    appender("PORTOFINO-DEFAULT", FileAppender) {
        def outputFile = "${catalinaBase}/logs/portofino.log";
        addInfo("Tomcat detected, using file appender: ${outputFile}");
        file = outputFile;
        encoder(PatternLayoutEncoder) {
            pattern = defaultPattern;
        }
    }
} else {
    appender("PORTOFINO-DEFAULT", ConsoleAppender) {
        addInfo("Falling back to console appender");
        encoder(PatternLayoutEncoder) {
            pattern = defaultPattern;
        }
    }
}

logger("org.hibernate", WARN)
logger("org.hibernate.connection.C3P0ConnectionProvider", INFO)
//logger("net.sourceforge.stripes.tag.FormTag", OFF)
root(INFO, ["PORTOFINO-DEFAULT"])