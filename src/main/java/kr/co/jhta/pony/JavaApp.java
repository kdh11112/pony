package kr.co.jhta.pony;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
 
import java.text.NumberFormat;
 
@SpringBootApplication
public class JavaApp {
 
  private static Log logger = LogFactory.getLog(JavaApp.class);
 
  public static void main(String[] args) throws Exception {
    SpringApplication.run(JavaApp.class, args);
    Runtime runtime = Runtime.getRuntime();
 
    final NumberFormat format = NumberFormat.getInstance();
 
    final long maxMemory = runtime.maxMemory();
    final long allocatedMemory = runtime.totalMemory();
    final long freeMemory = runtime.freeMemory();
    final long mb = 1024 * 1024;
    final String mega = " MB";
 
    logger.info("========================== Memory Info ==========================");
    logger.info("Free memory: " + format.format(freeMemory / mb) + mega);
    logger.info("Allocated memory: " + format.format(allocatedMemory / mb) + mega);
    logger.info("Max memory: " + format.format(maxMemory / mb) + mega);
    logger.info("Total free memory: " + format.format((freeMemory + (maxMemory - allocatedMemory)) / mb) + mega);
    logger.info("=================================================================\n");
  }
 
}