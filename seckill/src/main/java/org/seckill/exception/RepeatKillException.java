package org.seckill.exception;

/**
 * 重复异常秒杀（运行期异常）
 */
public class RepeatKillException extends SeckillException{
    public RepeatKillException(String message){
        super(message);
    }
    public RepeatKillException(String message, Throwable cause){
        super(message,cause);
    }

}
