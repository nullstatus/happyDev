package io.github.qlsc.util;

import android.util.Log;

/**
 * 日志工具类
 * 只需要修改 LEVEL 常量的值，自由控制日志的打印行为
 * 开发阶段，LEVEL = VERBOSE，上线阶段 LEVEL = NOTHING
 * Created by qlsc on 2016/5/25.
 */
public class LogUtil {
    public static final int VERBOSE = 1;
    public static final int DEBUG = 2;
    public static final int INFO = 3;
    public static final int WARN = 4;
    public static final int ERROR = 5;
    public static final int NOTHING = 6;
    public static final int LEVEL = VERBOSE;

    public static void v(String tag,String msg) {
        if (LEVEL<=VERBOSE){
            Log.v(tag,msg);
        }
    }
    public static void d(String tag,String msg) {
        if (LEVEL<=DEBUG){
            Log.d(tag,msg);
        }
    }
    public static void i(String tag,String msg) {
        if (LEVEL<=INFO){
            Log.i(tag,msg);
        }
    }
    public static void w(String tag,String msg) {
        if (LEVEL<=WARN){
            Log.w(tag,msg);
        }
    }
    public static void e(String tag,String msg) {
        if (LEVEL<=ERROR){
            Log.e(tag,msg);
        }
    }
}
